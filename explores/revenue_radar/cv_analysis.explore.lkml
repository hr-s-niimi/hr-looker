# ============================================================
# Explore: CV Analysis
# ============================================================

include: "/views/revenue_radar/tabiraku_booking_bigquery_analysis.view.lkml"
include: "/views/revenue_radar/facility_master.view.lkml"

explore: tabiraku_booking_bigquery_analysis {
  label: "CV Analysis"
  description: "新規予約 (CV) の日次・施設別集計"

  sql_always_where:
    ${tabiraku_booking_bigquery_analysis.conversion_date} < CURRENT_DATE('Asia/Tokyo')
  ;;

  join: facility_master {
    view_label: "施設マスタ"
    relationship: many_to_one
    sql_on: ${tabiraku_booking_bigquery_analysis.facility_code} = ${facility_master.facility_id} ;;
  }
}
