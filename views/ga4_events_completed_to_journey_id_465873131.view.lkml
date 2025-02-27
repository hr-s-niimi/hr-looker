view: ga4_events_completed_to_journey_id_465873131 {
  derived_table: {
    sql:
    WITH ga4_completed AS (
      SELECT
        '465873131' as ga4_id,
        event_timestamp as event_timestamp_completed,
        event_name,
        event_date,
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') as ga_session_id,
        (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'journey_id_start') as journey_id_start,
        (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') as page_location,
        device,
        geo,
        app_info,
        user_pseudo_id,
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') || "-" || user_pseudo_id as key
      FROM
        `hop4-analysis.analytics_465873131.events_intraday_2025*`
      WHERE event_name = "completed"
    ),
    ga4_session_start AS (
      SELECT
        '465873131' as ga4_id,
        event_timestamp as event_timestamp_session_start,
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') as ga_session_id,
        user_pseudo_id,
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') || "-" || user_pseudo_id as key,
        (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'medium') AS traffic_source_medium,
        (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'source') AS traffic_source_source,
        (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'campaign') AS traffic_source_campaign,
      FROM
        `hop4-analysis.analytics_465873131.events_intraday_2025*`
      WHERE event_name = "session_start"
    ),
    ga4_journey_id_start AS (
      SELECT
        '465873131' as ga4_id,
        event_timestamp as event_timestamp_journey_id_start,
        event_name,
        event_date,
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') as ga_session_id,
        (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'journey_id_start') as journey_id_start,
        device,
        geo,
        app_info,
        user_pseudo_id,
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id') || "-" || user_pseudo_id as key,
      FROM
        `hop4-analysis.analytics_465873131.events_intraday_2025*`
      WHERE event_name = "journey_id_start"
    ),
    tmp AS (
      SELECT
        c.*,
        s.event_timestamp_session_start,
        s.traffic_source_medium,
        s.traffic_source_source,
        s.traffic_source_campaign,
        j.event_timestamp_journey_id_start,
        j.journey_id_start as journey_id_start_2,
        (c.event_timestamp_completed - j.event_timestamp_journey_id_start) as event_timestamp_diff
      FROM
        ga4_completed as c
      LEFT JOIN
        ga4_session_start as s ON c.key = s.key
      LEFT JOIN
        ga4_journey_id_start as j ON c.key = j.key
      QUALIFY ROW_NUMBER() OVER (PARTITION BY c.key ORDER BY ABS(c.event_timestamp_completed - s.event_timestamp_session_start)) = 1
      AND (c.event_timestamp_completed - j.event_timestamp_journey_id_start) >= 0 or (c.event_timestamp_completed - j.event_timestamp_journey_id_start) is null
    )
    SELECT * FROM tmp
  ;;
  }

  # dimension_group: partirion {
  #   type: time
  #   sql: timestamp(parse_date('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d\d\d\d\d'))) ;;
  # }

  dimension_group: date {
    type: time
    datatype: timestamp
    timeframes: [date,week,month,year,time]
    sql: timestamp_micros(event_timestamp_completed)     ;;
  }

  dimension: key {
    type: string
    sql: ${user_pseudo_id} || "-" ||  ${ga_session_id};;
  }
  dimension: ga4_id {
    type: string
    sql: ${TABLE}.ga4_id ;;
  }
  dimension: ga_session_id {
    type: number
    sql: ${TABLE}.ga_session_id ;;
  }
  dimension: journey_id_start {
    type: string
    sql: ${TABLE}.journey_id_start ;;
  }
  dimension: journey_id_start_2 {
    type: string
    sql: ${TABLE}.journey_id_start_2 ;;
    html: "<a target='_blank' href='https://tabi-support.hoshinoresorts.systems/journey/{{ value }}'>{{ value }}</a>" ;;
  }
  # measure: journey_id_link {
  #   type: string
  #   html: "<a target='_blank' href='https://tabi-support.hoshinoresorts.systems/journey/{{ value }}'>{{ value }}</a>" ;;
  #   sql: ${journey_id_start_2} ;;
  # }

  dimension: device__browser {
    type: string
    sql: ${TABLE}.device.browser ;;
    group_label: "Device"
    group_item_label: "Browser"
  }
  dimension: device__browser_version {
    type: string
    sql: ${TABLE}.device.browser_version ;;
    group_label: "Device"
    group_item_label: "Browser Version"
  }
  dimension: device__category {
    type: string
    sql: ${TABLE}.device.category ;;
    group_label: "Device"
    group_item_label: "Category"
  }
  dimension: publisher__ad_source_name {
    type: string
    sql: ${TABLE}.publisher.ad_source_name ;;
    group_label: "Publisher"
    group_item_label: "Ad Source Name"
  }
  dimension: device__mobile_brand_name {
    type: string
    sql: ${TABLE}.device.mobile_brand_name ;;
    group_label: "Device"
    group_item_label: "Mobile Brand Name"
  }
  dimension: device__mobile_marketing_name {
    type: string
    sql: ${TABLE}.device.mobile_marketing_name ;;
    group_label: "Device"
    group_item_label: "Mobile Marketing Name"
  }
  dimension: device__mobile_model_name {
    type: string
    sql: ${TABLE}.device.mobile_model_name ;;
    group_label: "Device"
    group_item_label: "Mobile Model Name"
  }

  dimension: device__operating_system {
    type: string
    sql: ${TABLE}.device.operating_system ;;
    group_label: "Device"
    group_item_label: "Operating System"
  }
  dimension: device__operating_system_version {
    type: string
    sql: ${TABLE}.device.operating_system_version ;;
    group_label: "Device"
    group_item_label: "Operating System Version"
  }

  dimension: device__web_info__browser {
    type: string
    sql: ${TABLE}.device.web_info.browser ;;
    group_label: "Device Web Info"
    group_item_label: "Browser"
  }
  dimension: device__web_info__browser_version {
    type: string
    sql: ${TABLE}.device.web_info.browser_version ;;
    group_label: "Device Web Info"
    group_item_label: "Browser Version"
  }
  dimension: device__web_info__hostname {
    type: string
    sql: ${TABLE}.device.web_info.hostname ;;
    group_label: "Device Web Info"
    group_item_label: "Hostname"
  }

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }
  dimension: event_dimensions__hostname {
    type: string
    sql: ${TABLE}.event_dimensions.hostname ;;
    group_label: "Event Dimensions"
    group_item_label: "Hostname"
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  dimension: event_params {
    hidden: yes
    sql: ${TABLE}.event_params ;;
  }


  dimension: geo__city {
    type: string
    sql: ${TABLE}.geo.city ;;
    group_label: "Geo"
    group_item_label: "City"
  }
  dimension: geo__country {
    type: string
    sql: ${TABLE}.geo.country ;;
    group_label: "Geo"
    group_item_label: "Country"
  }


  dimension: traffic_source__medium {
    type: string
    sql: ${TABLE}.traffic_source_medium;;
    group_label: "Traffic Source"
    group_item_label: "Medium"
  }
  dimension: traffic_source__source {
    type: string
    sql: ${TABLE}.traffic_source_source;;
    group_label: "Traffic Source"
    group_item_label: "Source"
  }
  dimension: traffic_source__campaign {
    type: string
    sql: ${TABLE}.traffic_source_campaign ;;
    group_label: "Traffic Source"
    group_item_label: "Campaign"
  }


  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  measure: count_completed {
    type: count
    drill_fields: [detail*]
  }

  dimension: page_location {
    label: "ページロケーション別"
    type: string
    sql: ${TABLE}.page_location ;;
    full_suggestions: yes
  }

  dimension: page_group {
    label: "ページパスグループ"
    type: string
    sql: CASE
       WHEN ${page_location} LIKE '%/hotels/kaisengokuhara%' OR ${page_location} LIKE '%/facilities/0000000124%' THEN '仙石原'
       WHEN ${page_location} LIKE '%/hotels/kaiporotp%' OR ${page_location} LIKE '%/facilities/0000000129%' THEN 'ポロト'
       WHEN ${page_location} LIKE '%/facilities/%' THEN CONCAT('施設ID:', REGEXP_EXTRACT(${page_location}, '/facilities/([0-9]+)'))
       ELSE 'その他'
     END;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      event_name,
      user_pseudo_id,
      geo__country,
      geo__city,
      publisher__ad_source_name,
      device__mobile_model_name,
      device__mobile_brand_name,
      device__web_info__hostname,
      event_dimensions__hostname,
      device__mobile_marketing_name,
      traffic_source__medium,
      traffic_source__source,
      traffic_source__campaign,
    ]
  }
}
