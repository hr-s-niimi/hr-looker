# ============================================================
# Explore: CV Analysis
# ============================================================

include: "/views/revenue_radar/tabiraku_booking_bigquery_analysis.view.lkml"
include: "/views/revenue_radar/facility_master.view.lkml"

explore: tabiraku_booking_bigquery_analysis {
  label: "CV Analysis"
  description: "新規予約 (CV) の日次・施設別集計"

  # 期間比較のデフォルト。compare_to=None なら現期間のみ、Period なら This+Last。
  always_filter: {
    filters: [tabiraku_booking_bigquery_analysis.date_filter: "7 days", tabiraku_booking_bigquery_analysis.compare_to: "None"]
  }

  # 今日 (JST) 除外 + 期間比較 (compare_to で This のみ / This+Last を切替)
  sql_always_where:
    ${tabiraku_booking_bigquery_analysis.conversion_date} < CURRENT_DATE('Asia/Tokyo')
    AND (
      {% if "${tabiraku_booking_bigquery_analysis.compare_to_value}" == "None" %}
        ${tabiraku_booking_bigquery_analysis.conversion_date} BETWEEN ${tabiraku_booking_bigquery_analysis.date_start} AND ${tabiraku_booking_bigquery_analysis.date_end}
      {% else %}
        ${tabiraku_booking_bigquery_analysis.conversion_date} BETWEEN ${tabiraku_booking_bigquery_analysis.date_start} AND ${tabiraku_booking_bigquery_analysis.date_end}
        OR
        ${tabiraku_booking_bigquery_analysis.conversion_date} BETWEEN ${tabiraku_booking_bigquery_analysis.period_last_start} AND ${tabiraku_booking_bigquery_analysis.period_last_end}
      {% endif %}
    )
  ;;

  join: facility_master {
    view_label: "施設マスタ"
    relationship: many_to_one
    sql_on: ${tabiraku_booking_bigquery_analysis.facility_code} = ${facility_master.facility_id} ;;
  }
}
