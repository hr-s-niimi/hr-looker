# ============================================================
# 期間比較ユーティリティ view (Period-over-Period)
# flebol_change_log に extends され、基準期間/前期間の境界日を計算する。
# 全境界は type: string + 明示 DATE() で DATE 値を返す。
# (type: date にすると Looker が DATE() を二重ラップして型エラーになるため)
# ============================================================

view: revenue_radar_period_compare {

  filter: date_filter {
    view_label: "期間指定"
    label: "期間フィルタ"
    type: date
    description: "基準期間(現期間)。常にこのフィルタで期間を指定する"
  }

  parameter: compare_to {
    view_label: "期間指定"
    label: "期間比較"
    description: "「期間フィルタ」とセットで利用する"
    type: unquoted
    allowed_value: { label: "比較なし"   value: "None" }
    allowed_value: { label: "過去の期間" value: "Period" }
    allowed_value: { label: "過去の週"   value: "Week" }
    allowed_value: { label: "過去の月"   value: "Month" }
    allowed_value: { label: "過去の年"   value: "Year" }
    default_value: "None"
  }

  dimension: compare_to_value {
    hidden: yes
    type: string
    sql: {{ compare_to._parameter_value }} ;;
  }

  # --- 基準期間の開始/終了 (DATE を返す。type: string で二重ラップ回避) ---
  dimension: date_start {
    hidden: yes
    view_label: "期間指定"
    label: "開始日"
    type: string
    sql: DATE({% date_start date_filter %}, 'Asia/Tokyo') ;;
  }

  dimension: date_end {
    hidden: yes
    view_label: "期間指定"
    label: "終了日"
    type: string
    sql: DATE({% date_end date_filter %}, 'Asia/Tokyo') ;;
  }

  dimension: days_in_period {
    hidden: yes
    view_label: "期間指定"
    description: "基準期間の日数"
    type: number
    sql: DATE_DIFF(${date_end}, ${date_start}, DAY) + 1 ;;
  }

  # --- 前期間の開始/終了 (DATE を返す。type: string で二重ラップ回避) ---
  dimension: period_last_start {
    hidden: yes
    view_label: "期間指定"
    description: "前の期間の開始日"
    type: string
    sql:
        {% if "${compare_to_value}" == "None" %}
            NULL
        {% elsif "${compare_to_value}" == "Period" %}
            DATE_SUB(${date_start}, INTERVAL ${days_in_period} DAY)
        {% else %}
            DATE_SUB(${date_start}, INTERVAL 1 {% parameter compare_to %})
        {% endif %}
        ;;
  }

  dimension: period_last_end {
    hidden: yes
    view_label: "期間指定"
    description: "前の期間の終了日"
    type: string
    sql:
        {% if "${compare_to_value}" == "None" %}
            NULL
        {% elsif "${compare_to_value}" == "Period" %}
            DATE_SUB(${date_start}, INTERVAL 1 DAY)
        {% else %}
            DATE_SUB(${date_end}, INTERVAL 1 {% parameter compare_to %})
        {% endif %}
        ;;
  }
}
