# ============================================================
# 予約変更ログ (FleBOL) - 拡張 view
# 基底 view (flebol_change_log) に業務ラベル・派生 dim・measure を追加
# ============================================================

include: "/views/revenue_radar/flebol_change_log.view.lkml"
include: "/views/revenue_radar/facility_master.view.lkml"

view: +flebol_change_log {
  view_label: "予約変更ログ"

  # ==================== 派生 dimension: ブランド名 ====================
  dimension: brand_name {
    label: "ブランド"
    group_label: "施設"
    type: string
    required_joins: [facility_master]
    sql: CASE
           WHEN ${facility_master.brands} IN ('星のや', '界', 'OMO', 'BEB', 'LUCY') THEN ${facility_master.brands}
           WHEN ${facility_master.brands} IS NOT NULL THEN 'その他'
           ELSE 'マスタ未登録'
         END ;;
  }

  dimension: is_target_brand {
    label: "分析対象ブランド"
    group_label: "施設"
    type: yesno
    required_joins: [facility_master]
    sql: ${brand_name} IN ('星のや', '界', 'OMO', 'BEB', 'LUCY') ;;
  }

  # ==================== 派生 dimension: 実質変更フラグ ====================
  dimension: is_meaningful_change {
    label: "実質変更フラグ"
    description: "CANCEL または、CHANGE で before/after いずれかに差分がある行が yes"
    group_label: "変更内容"
    type: yesno
    sql: ${TABLE}.changeStatus = 'CANCEL'
      OR ${TABLE}.totalBillingAmountDifference != 0
      OR ${TABLE}.nightsDifference != 0
      OR ${TABLE}.roomCountDifference != 0
      OR ${TABLE}.checkInDaysDifference != 0
      OR TO_JSON_STRING(${TABLE}.packageCodesBefore) != TO_JSON_STRING(${TABLE}.packageCodesAfter) ;;
  }

  # ==================== 派生 dimension: リードタイム区分 ====================
  dimension: lead_time_bucket {
    label: "リードタイム区分 (CI までの日数)"
    group_label: "変更内容"
    type: string
    sql: CASE
           WHEN ${TABLE}.daysBeforeCheckIn <= 3   THEN '0-3日'
           WHEN ${TABLE}.daysBeforeCheckIn <= 7   THEN '4-7日'
           WHEN ${TABLE}.daysBeforeCheckIn <= 14  THEN '8-14日'
           WHEN ${TABLE}.daysBeforeCheckIn <= 30  THEN '15-30日'
           WHEN ${TABLE}.daysBeforeCheckIn <= 60  THEN '31-60日'
           WHEN ${TABLE}.daysBeforeCheckIn <= 90  THEN '61-90日'
           WHEN ${TABLE}.daysBeforeCheckIn <= 180 THEN '91-180日'
           WHEN ${TABLE}.daysBeforeCheckIn <= 365 THEN '181-365日'
           ELSE '365日超'
         END ;;
    order_by_field: days_before_check_in
  }

  # ==================== 期間区分 (This/Last) ====================
  # extends した revenue_radar_period_compare の期間境界を使い、
  # change_date が基準期間内なら 'This'、前期間内なら 'Last'、それ以外は NULL。
  # app はこれを GROUP BY に使い、This/Last を1クエリで取得する。
  dimension: period {
    view_label: "期間指定"
    label: "期間区分"
    type: string
    sql:
      CASE
        WHEN ${change_date} BETWEEN ${date_start} AND ${date_end} THEN 'This'
        WHEN ${change_date} BETWEEN ${period_last_start} AND ${period_last_end} THEN 'Last'
      END ;;
  }

  # ==================== 件数 measure ====================
  measure: count_change {
    label: "CHANGE 件数"
    type: count
    filters: [change_status: "CHANGE"]
  }

  measure: count_change_meaningful {
    label: "CHANGE 実質件数"
    description: "no-op を除いた実質的な予約変更件数"
    type: count
    filters: [change_status: "CHANGE", is_meaningful_change: "yes"]
  }

  measure: count_cancel {
    label: "CANCEL 件数"
    type: count
    filters: [change_status: "CANCEL"]
  }

  # ==================== 金額 measure ====================
  measure: net_revenue_impact {
    label: "Net Revenue Impact"
    description: "予約変更による純売上変動"
    type: sum
    sql: ${TABLE}.totalBillingAmountDifference ;;
    filters: [change_status: "CHANGE"]
    value_format_name: decimal_0
  }

  measure: lost_revenue {
    label: "Lost Revenue"
    description: "キャンセルによる売上損失額"
    type: sum
    sql: ${TABLE}.totalBillingAmountBefore ;;
    filters: [change_status: "CANCEL"]
    value_format_name: decimal_0
  }

  # ==================== Upsell / Downsell ====================
  measure: upsell_count {
    label: "Upsell 件数"
    type: count
    filters: [change_status: "CHANGE", total_billing_amount_difference: ">0"]
  }

  measure: downsell_count {
    label: "Downsell 件数"
    type: count
    filters: [change_status: "CHANGE", total_billing_amount_difference: "<0"]
  }

  # ==================== 率 measure ====================
  measure: change_upsell_rate {
    label: "Change Upsell Rate"
    type: number
    sql: SAFE_DIVIDE(${upsell_count}, NULLIF(${count_change_meaningful}, 0)) * 100 ;;
    value_format_name: decimal_1
  }

  measure: cancel_rate {
    label: "Cancel Rate"
    type: number
    sql: SAFE_DIVIDE(${count_cancel}, NULLIF(${count_change} + ${count_cancel}, 0)) * 100 ;;
    value_format_name: decimal_1
  }

  # ==================== 平均 measure ====================
  measure: avg_days_before_check_in {
    label: "平均リードタイム (日)"
    type: average
    sql: ${TABLE}.daysBeforeCheckIn ;;
    value_format_name: decimal_1
  }

  measure: avg_nights_difference {
    label: "平均泊数変動"
    type: average
    sql: ${TABLE}.nightsDifference ;;
    filters: [change_status: "CHANGE"]
    value_format_name: decimal_2
  }

  measure: avg_check_in_days_difference {
    label: "平均チェックイン日シフト (日)"
    type: average
    sql: ${TABLE}.checkInDaysDifference ;;
    filters: [change_status: "CHANGE"]
    value_format_name: decimal_2
  }
}
