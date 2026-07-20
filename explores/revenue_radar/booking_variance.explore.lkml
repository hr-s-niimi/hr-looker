# ============================================================
# Explore: Booking Variance
# ============================================================
include: "/views/revenue_radar/revenue_radar_period_compare.view.lkml"
include: "/views/revenue_radar/flebol_change_log.view.lkml"
include: "/views/revenue_radar/ref_flebol_change_log.view.lkml"
include: "/views/revenue_radar/facility_master.view.lkml"

explore: flebol_change_log {
  label: "Booking Variance"
  description: "予約変更・キャンセルの動き、施設別集計、顧客行動分析"

  # 期間比較のデフォルト。compare_to=None なら現期間のみ (通常集計)、
  # app が compare_to=Period を渡したクエリのみ This+Last 両期間を通す (KPI delta 用)。
  always_filter: {
    filters: [flebol_change_log.date_filter: "7 days", flebol_change_log.compare_to: "None"]
  }

  # 常時 WHERE:
  #   (1) 6/11 以降、かつ 今日 (JST) を除外 (S3 焼付バグ回避)
  #   (2) compare_to=None → 現期間 (This) のみ / それ以外 → 現期間 + 前期間 (This+Last)
  sql_always_where:
    ${flebol_change_log.change_date} >= DATE '2026-06-11'
    AND ${flebol_change_log.change_date} < CURRENT_DATE('Asia/Tokyo')
    AND (
      {% if "${flebol_change_log.compare_to_value}" == "None" %}
        ${flebol_change_log.change_date} BETWEEN ${flebol_change_log.date_start} AND ${flebol_change_log.date_end}
      {% else %}
        ${flebol_change_log.change_date} BETWEEN ${flebol_change_log.date_start} AND ${flebol_change_log.date_end}
        OR
        ${flebol_change_log.change_date} BETWEEN ${flebol_change_log.period_last_start} AND ${flebol_change_log.period_last_end}
      {% endif %}
    )
  ;;

  join: facility_master {
    view_label: "施設マスタ"
    relationship: many_to_one
    sql_on: ${flebol_change_log.facility_code} = ${facility_master.facility_id} ;;
  }
}
