# ============================================================
# 予約変更ログ (FleBOL) - 基底 view
# ============================================================
include: "/views/revenue_radar/revenue_radar_period_compare.view.lkml"


view: flebol_change_log {
  extends: [revenue_radar_period_compare]

  derived_table: {
    sql:
      SELECT * FROM `hop4-analysis.tabiraku_data_source.flebol_change_log_raw`
      QUALIFY ROW_NUMBER() OVER (
        PARTITION BY
          facilityCode, journeyNumber, journeyId, firstBookingDateTime,
          changeDate, changeStatus, daysBeforeCheckIn,
          totalBillingAmountBefore, totalBillingAmountAfter, totalBillingAmountDifference,
          nightsBefore, nightsAfter, nightsDifference,
          roomCountBefore, roomCountAfter, roomCountDifference,
          checkInBefore, checkInAfter, checkInDaysDifference,
          TO_JSON_STRING(packageCodesBefore), TO_JSON_STRING(packageCodesAfter)
        ORDER BY 1
      ) = 1
    ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(
      ${TABLE}.journeyId, '|',
      CAST(${TABLE}.changeDate AS STRING), '|',
      ${TABLE}.changeStatus
    ) ;;
  }

  dimension: facility_code {
    type: string
    sql: ${TABLE}.facilityCode ;;
  }

  dimension: journey_number {
    type: string
    sql: ${TABLE}.journeyNumber ;;
  }

  dimension: journey_id {
    type: string
    sql: ${TABLE}.journeyId ;;
  }

  dimension_group: first_booking {
    type: time
    timeframes: [raw, time, date, hour, week, month, year]
    convert_tz: yes
    sql: ${TABLE}.firstBookingDateTime ;;
  }

  dimension_group: change {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, quarter, year, day_of_week]
    convert_tz: no
    sql: ${TABLE}.changeDate ;;
  }

  dimension_group: check_in_before {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, year]
    convert_tz: no
    sql: ${TABLE}.checkInBefore ;;
  }

  dimension_group: check_in_after {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, year]
    convert_tz: no
    sql: ${TABLE}.checkInAfter ;;
  }

  dimension: check_in_days_difference {
    type: number
    sql: ${TABLE}.checkInDaysDifference ;;
  }

  dimension: change_status {
    type: string
    sql: ${TABLE}.changeStatus ;;
  }

  dimension: days_before_check_in {
    type: number
    sql: ${TABLE}.daysBeforeCheckIn ;;
  }

  dimension: total_billing_amount_before {
    type: number
    sql: ${TABLE}.totalBillingAmountBefore ;;
    value_format_name: decimal_0
  }

  dimension: total_billing_amount_after {
    type: number
    sql: ${TABLE}.totalBillingAmountAfter ;;
    value_format_name: decimal_0
  }

  dimension: total_billing_amount_difference {
    type: number
    sql: ${TABLE}.totalBillingAmountDifference ;;
    value_format_name: decimal_0
  }

  dimension: nights_before {
    type: number
    sql: ${TABLE}.nightsBefore ;;
  }

  dimension: nights_after {
    type: number
    sql: ${TABLE}.nightsAfter ;;
  }

  dimension: nights_difference {
    type: number
    sql: ${TABLE}.nightsDifference ;;
  }

  dimension: room_count_before {
    type: number
    sql: ${TABLE}.roomCountBefore ;;
  }

  dimension: room_count_after {
    type: number
    sql: ${TABLE}.roomCountAfter ;;
  }

  dimension: room_count_difference {
    type: number
    sql: ${TABLE}.roomCountDifference ;;
  }

  dimension: guest_count_difference {
    type: number
    sql: ${TABLE}.guestCountDifference ;;
  }

  dimension: package_codes_before {
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.packageCodesBefore, ',') ;;
  }

  dimension: package_codes_after {
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.packageCodesAfter, ',') ;;
  }

  measure: count {
    type: count
    drill_fields: [journey_id, facility_code, change_status, change_date]
  }
}
