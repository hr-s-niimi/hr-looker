view: tabirakiu_ygets_ab_test_model {
  sql_table_name: `hop4-analysis.recx.ab_testing` ;;

  dimension: date_raw {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: date_date {
    type: string
    sql: CAST(${TABLE}.date as STRING) ;;
  }

  dimension: date_week {
    type: string
    sql: CAST(DATE_TRUNC(${TABLE}.date, WEEK) as STRING) ;;
  }

  dimension: date_month_formatted {
    type: string
    sql: FORMAT_DATE("%Y年%m月", ${TABLE}.date) ;;
  }

  filter: selected_month {
    type: string
    sql: ${date_month_formatted} ;; #ラベルを「2025年03月」のように表示するための加工
  }

  dimension: date_quarter {
    type: string
    sql: CAST(DATE_TRUNC(${TABLE}.date, QUARTER) as STRING) ;;
  }

  dimension: date_year {
    type: string
    sql: CAST(DATE_TRUNC(${TABLE}.date, YEAR) as STRING) ;;
  }

  dimension: actual_cvr_tabiraku {
    type: number
    sql: ${TABLE}.actual_cvr_tabiraku ;;
    value_format_name: decimal_2
  }

  dimension: predicted_cvr_ygets {
    type: number
    sql: ${TABLE}.predicted_cvr_ygets ;;
    value_format_name: decimal_2
  }

  measure: average_actual_cvr_tabiraku {
    type: average
    sql: ${actual_cvr_tabiraku} ;;
    value_format_name: decimal_2
  }

  measure: average_predicted_cvr_ygets {
    type: average
    sql: ${predicted_cvr_ygets} ;;
    value_format_name: decimal_2
  }

  measure: count {
    type: count
    drill_fields: [date_date]
  }
}
