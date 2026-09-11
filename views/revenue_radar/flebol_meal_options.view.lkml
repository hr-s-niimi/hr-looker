# ============================================================
# 食事オプション変更 - 基底 view (物理層)
# flebol_change_log(dedup済 derived_table)の mealOptions を UNNEST し
# 1行 = 1オプションの増減 に展開。change-event と grain が違うため独立 view
# (+flebol_change_log の refinement にすると fan-out するので不可)。
# 業務ラベル・派生 dim・measure は ref_flebol_meal_options に置く。
# ============================================================
include: "/views/revenue_radar/flebol_change_log.view.lkml"

view: flebol_meal_options {
  derived_table: {
    sql:
      SELECT
        c.facilityCode                                    AS facility_code,
        c.journeyNumber                                   AS journey_number,
        c.changeDate                                      AS change_date,
        c.changeDateTime                                  AS change_datetime,
        m.stayDate                                        AS stay_date,
        m.meal                                            AS meal,
        m.optionCode                                      AS option_code,
        COALESCE(NULLIF(m.optionName, ''), m.optionCode)  AS option_name,
        m.qtyBefore                                       AS quantity_before,
        m.qtyAfter                                        AS quantity_after,
        (m.qtyAfter - m.qtyBefore)                        AS quantity_diff
      FROM ${flebol_change_log.SQL_TABLE_NAME} AS c,
           UNNEST(c.mealOptions) AS m
      WHERE c.changeStatus = 'CHANGE'
        AND c.changeDateTime >= '2026-09-07T03:00:00'   -- 本番リリース(9/7 12:00 JST)以降。test除外
        AND c.changeDate < CURRENT_DATE('Asia/Tokyo')   -- 今日除外(S3焼付バグ回避・基底と同方針)
      ;;
  }

  dimension: meal_option_line_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.journey_number,'|',${TABLE}.change_datetime,'|',
      CAST(${TABLE}.stay_date AS STRING),'|',${TABLE}.meal,'|',${TABLE}.option_code) ;;
  }

  dimension: facility_code { type: string sql: ${TABLE}.facility_code ;; }
  dimension: journey_number { type: string hidden: yes sql: ${TABLE}.journey_number ;; }

  dimension: option_name {
    label: "オプション"
    type: string
    sql: ${TABLE}.option_name ;;
  }
  dimension: option_code { type: string hidden: yes sql: ${TABLE}.option_code ;; }
  dimension: meal        { type: string hidden: yes sql: ${TABLE}.meal ;; }

  dimension_group: change {
    type: time
    datatype: date
    timeframes: [raw, date, week, month]
    convert_tz: no
    sql: ${TABLE}.change_date ;;
  }
  dimension_group: stay {
    type: time
    datatype: date
    timeframes: [raw, date, month]
    convert_tz: no
    sql: ${TABLE}.stay_date ;;
  }

  dimension: quantity_before { type: number hidden: yes sql: ${TABLE}.quantity_before ;; }
  dimension: quantity_after  { type: number hidden: yes sql: ${TABLE}.quantity_after ;; }
  dimension: quantity_diff   { type: number hidden: yes sql: ${TABLE}.quantity_diff ;; }
}
