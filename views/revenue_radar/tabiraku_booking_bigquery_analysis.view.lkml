# ============================================================
# CV (新規予約) 生ログ
# ソース: hop4-analysis.tabiraku_data_source.tabiraku_booking_bigquery_analysis
# 1 行 = 1 CV イベント (重複なし、dedup 不要)
# ============================================================

include: "/views/revenue_radar/revenue_radar_period_compare.view.lkml"

view: tabiraku_booking_bigquery_analysis {
  extends: [revenue_radar_period_compare]
  sql_table_name: `hop4-analysis.tabiraku_data_source.tabiraku_booking_bigquery_analysis` ;;

  # ==================== primary key ====================
  dimension: journey_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.journeyId ;;
  }

  # ==================== 素の dimension ====================
  dimension: facility_code {
    type: string
    sql: ${TABLE}.facilityCode ;;
  }

  # 注: brandType (STRING 数値) は分析側では基本使わない。
  #     ブランド名は facility_master.brands を join して取得する
  dimension: brand_type {
    type: string
    sql: ${TABLE}.brandType ;;
  }

  dimension: conversion_status {
    type: string
    sql: ${TABLE}.conversionStatus ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.userAgent ;;
  }

  # ==================== TIMESTAMP (UTC 保持、JST 表示は model の query_timezone で制御) ====================
  dimension_group: conversion {
    type: time
    timeframes: [
      raw,
      time,
      date,
      hour,
      week,
      month,
      quarter,
      year,
      day_of_week
    ]
    convert_tz: yes
    sql: ${TABLE}.conversionDate ;;
  }

  # ==================== 期間区分 (This/Last) ====================
  # extends した revenue_radar_period_compare の期間境界を使い、
  # conversion_date (JST) が基準期間内なら 'This'、前期間内なら 'Last'、それ以外 NULL。
  dimension: period {
    view_label: "期間指定"
    label: "期間区分"
    type: string
    sql:
      CASE
        WHEN ${conversion_date} BETWEEN ${date_start} AND ${date_end} THEN 'This'
        WHEN ${conversion_date} BETWEEN ${period_last_start} AND ${period_last_end} THEN 'Last'
      END ;;
  }

  # ==================== measure ====================
  measure: count {
    type: count
    drill_fields: [journey_id, facility_code, conversion_status, conversion_date]
  }
}
