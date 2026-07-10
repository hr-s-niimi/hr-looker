# ============================================================
# Explore: Booking Variance
# ============================================================

include: "/views/revenue_radar/flebol_change_log.view.lkml"
include: "/views/revenue_radar/ref_flebol_change_log.view.lkml"
include: "/views/revenue_radar/facility_master.view.lkml"

explore: flebol_change_log {
  label: "Booking Variance"
  description: "予約変更・キャンセルの動き、施設別集計、顧客行動分析"

  # 常時 WHERE: 6/11 以降、かつ 今日 (JST) を除外
  sql_always_where:
    ${flebol_change_log.change_date} >= DATE '2026-06-11'
    AND ${flebol_change_log.change_date} < CURRENT_DATE('Asia/Tokyo')
  ;;

  # 施設マスタとの join
  join: facility_master {
    view_label: "施設マスタ"
    relationship: many_to_one
    sql_on: ${flebol_change_log.facility_code} = ${facility_master.facility_id} ;;
  }
}
