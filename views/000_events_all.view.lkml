view: events_all {
  sql_table_name: `hop4-analysis.analytics_465873131.events_intraday_*` ;;
  view_label: "ga_event_data"

  #-------------------------------------------
  # view: events_allのprimary_keyを定義
  dimension: event_id {
    primary_key: yes
    type: string
    sql: CONCAT(${user_pseudo_id}, '-', ${event_timestamp}) ;;
  }
  #-------------------------------------------

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
    hidden: yes
  }

  # dimension: event_data_mm {
  #   type: string
  #   sql: TIMESTAMP(PARSE_DATETIME("%Y%m%d%H%M%S", ${event_date})) ;;
  # }


  dimension_group: event_date_cast {
    type: time
    label: "イベント日"
    sql: TIMESTAMP(PARSE_DATE("%Y%m%d",${event_date})) ;;
    timeframes: [date, week, month, year]
  }

  dimension: event_date_yymmddhhmm {
    type: string
    label: "時間 (YYYY-MM-DD HH:MM)"
    sql: FORMAT_TIMESTAMP('%Y-%m-%d %H:%M', TIMESTAMP_MICROS(CAST(${TABLE}.event_timestamp AS INT64)), 'Asia/Tokyo') ;;
  }


  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }

  dimension: app_info__firebase_app_id {
    type: string
    sql: ${TABLE}.app_info.firebase_app_id ;;
    group_label: "App Info"
    group_item_label: "Firebase App ID"
  }

  dimension: app_info__id {
    type: string
    sql: ${TABLE}.app_info.id ;;
    group_label: "App Info"
    group_item_label: "ID"
  }

  dimension: app_info__install_source {
    type: string
    sql: ${TABLE}.app_info.install_source ;;
    group_label: "App Info"
    group_item_label: "Install Source"
  }

  dimension: app_info__install_store {
    type: string
    sql: ${TABLE}.app_info.install_store ;;
    group_label: "App Info"
    group_item_label: "Install Store"
  }

  dimension: app_info__version {
    type: string
    sql: ${TABLE}.app_info.version ;;
    group_label: "App Info"
    group_item_label: "Version"
  }

  dimension: collected_traffic_source__dclid {
    type: string
    sql: ${TABLE}.collected_traffic_source.dclid ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Dclid"
  }

  dimension: collected_traffic_source__gclid {
    type: string
    sql: ${TABLE}.collected_traffic_source.gclid ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Gclid"
  }

  dimension: collected_traffic_source__manual_campaign_id {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_campaign_id ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Campaign ID"
  }

  dimension: collected_traffic_source__manual_campaign_name {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_campaign_name ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Campaign Name"
  }

  dimension: collected_traffic_source__manual_content {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_content ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Content"
  }

  dimension: collected_traffic_source__manual_medium {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_medium ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Medium"
  }

  dimension: collected_traffic_source__manual_source {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_source ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Source"
  }

  dimension: collected_traffic_source__manual_term {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_term ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Term"
  }

  dimension: collected_traffic_source__srsltid {
    type: string
    sql: ${TABLE}.collected_traffic_source.srsltid ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Srsltid"
  }

  dimension: device__advertising_id {
    type: string
    sql: ${TABLE}.device.advertising_id ;;
    group_label: "Device"
    group_item_label: "Advertising ID"
  }

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

  dimension: device__is_limited_ad_tracking {
    type: string
    sql: ${TABLE}.device.is_limited_ad_tracking ;;
    group_label: "Device"
    group_item_label: "Is Limited Ad Tracking"
  }

  dimension: device__language {
    type: string
    sql: ${TABLE}.device.language ;;
    group_label: "Device"
    group_item_label: "Language"
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

  dimension: device__mobile_os_hardware_model {
    type: string
    sql: ${TABLE}.device.mobile_os_hardware_model ;;
    group_label: "Device"
    group_item_label: "Mobile OS Hardware Model"
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

  dimension: device__time_zone_offset_seconds {
    type: number
    sql: ${TABLE}.device.time_zone_offset_seconds ;;
    group_label: "Device"
    group_item_label: "Time Zone Offset Seconds"
  }

  dimension: device__vendor_id {
    type: string
    sql: ${TABLE}.device.vendor_id ;;
    group_label: "Device"
    group_item_label: "Vendor ID"
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

  dimension: ecommerce__purchase_revenue {
    type: number
    sql: ${TABLE}.ecommerce.purchase_revenue ;;
    group_label: "Ecommerce"
    group_item_label: "Purchase Revenue"
  }

  dimension: ecommerce__purchase_revenue_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.purchase_revenue_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Purchase Revenue In USD"
  }

  dimension: ecommerce__refund_value {
    type: number
    sql: ${TABLE}.ecommerce.refund_value ;;
    group_label: "Ecommerce"
    group_item_label: "Refund Value"
  }

  dimension: ecommerce__refund_value_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.refund_value_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Refund Value In USD"
  }

  dimension: ecommerce__shipping_value {
    type: number
    sql: ${TABLE}.ecommerce.shipping_value ;;
    group_label: "Ecommerce"
    group_item_label: "Shipping Value"
  }

  dimension: ecommerce__shipping_value_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.shipping_value_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Shipping Value In USD"
  }

  dimension: ecommerce__tax_value {
    type: number
    sql: ${TABLE}.ecommerce.tax_value ;;
    group_label: "Ecommerce"
    group_item_label: "Tax Value"
  }

  dimension: ecommerce__tax_value_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.tax_value_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Tax Value In USD"
  }

  dimension: ecommerce__total_item_quantity {
    type: number
    sql: ${TABLE}.ecommerce.total_item_quantity ;;
    group_label: "Ecommerce"
    group_item_label: "Total Item Quantity"
  }

  dimension: ecommerce__transaction_id {
    type: string
    sql: ${TABLE}.ecommerce.transaction_id ;;
    group_label: "Ecommerce"
    group_item_label: "Transaction ID"
  }

  dimension: ecommerce__unique_items {
    type: number
    sql: ${TABLE}.ecommerce.unique_items ;;
    group_label: "Ecommerce"
    group_item_label: "Unique Items"
  }

  dimension: event_bundle_sequence_id {
    type: number
    sql: ${TABLE}.event_bundle_sequence_id ;;
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

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: event_params {
    hidden: yes
    sql: ${TABLE}.event_params ;;
  }

  dimension: event_previous_timestamp {
    type: number
    sql: ${TABLE}.event_previous_timestamp ;;
  }

  dimension: event_server_timestamp_offset {
    type: number
    sql: ${TABLE}.event_server_timestamp_offset ;;
  }

  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: event_value_in_usd {
    type: number
    sql: ${TABLE}.event_value_in_usd ;;
  }

  dimension: geo__city {
    type: string
    sql: ${TABLE}.geo.city ;;
    group_label: "Geo"
    group_item_label: "City"
  }

  dimension: geo__continent {
    type: string
    sql: ${TABLE}.geo.continent ;;
    group_label: "Geo"
    group_item_label: "Continent"
  }

  dimension: geo__country {
    type: string
    sql: ${TABLE}.geo.country ;;
    group_label: "Geo"
    group_item_label: "Country"
  }

  dimension: geo__metro {
    type: string
    sql: ${TABLE}.geo.metro ;;
    group_label: "Geo"
    group_item_label: "Metro"
  }

  dimension: geo__region {
    type: string
    sql: ${TABLE}.geo.region ;;
    group_label: "Geo"
    group_item_label: "Region"
  }

  dimension: geo__sub_continent {
    type: string
    sql: ${TABLE}.geo.sub_continent ;;
    group_label: "Geo"
    group_item_label: "Sub Continent"
  }

  dimension: is_active_user {
    type: yesno
    sql: ${TABLE}.is_active_user ;;
  }

  dimension: items {
    hidden: yes
    sql: ${TABLE}.items ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: privacy_info__ads_storage {
    type: string
    sql: ${TABLE}.privacy_info.ads_storage ;;
    group_label: "Privacy Info"
    group_item_label: "Ads Storage"
  }

  dimension: privacy_info__analytics_storage {
    type: string
    sql: ${TABLE}.privacy_info.analytics_storage ;;
    group_label: "Privacy Info"
    group_item_label: "Analytics Storage"
  }

  dimension: privacy_info__uses_transient_token {
    type: string
    sql: ${TABLE}.privacy_info.uses_transient_token ;;
    group_label: "Privacy Info"
    group_item_label: "Uses Transient Token"
  }

  dimension: stream_id {
    type: string
    sql: ${TABLE}.stream_id ;;
  }

  dimension: traffic_source__medium {
    type: string
    sql: ${TABLE}.traffic_source.medium ;;
    group_label: "Traffic Source"
    group_item_label: "Medium"
  }

  dimension: traffic_source__name {
    type: string
    sql: ${TABLE}.traffic_source.name ;;
    group_label: "Traffic Source"
    group_item_label: "Name"
  }

  dimension: traffic_source__source {
    type: string
    sql: ${TABLE}.traffic_source.source ;;
    group_label: "Traffic Source"
    group_item_label: "Source"
  }

  dimension: user_first_touch_timestamp {
    type: number
    sql: ${TABLE}.user_first_touch_timestamp ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_ltv__currency {
    type: string
    sql: ${TABLE}.user_ltv.currency ;;
    group_label: "User Ltv"
    group_item_label: "Currency"
  }

  dimension: user_ltv__revenue {
    type: number
    sql: ${TABLE}.user_ltv.revenue ;;
    group_label: "User Ltv"
    group_item_label: "Revenue"
  }

  dimension: user_properties {
    hidden: yes
    sql: ${TABLE}.user_properties ;;
  }

  #-------------------------------------------
  ## Measures

  measure: count {
    type: count
    label: "カウント"
  }

  measure: total_users {
    group_label: "User"
    label: "ユーザー数"
    type: count_distinct
    sql: ${user_pseudo_id} ;;
  }

  measure: total_new_users {
    group_label: "User"
    label: "新規ユーザー数"
    type: count_distinct
    sql: ${user_pseudo_id} ;;
    filters: [event_name: "first_visit"]
  }

  measure: new_user_ratio {
    group_label: "User"
    label: "新規ユーザー割合"
    type: number
    sql: ${total_new_users} / ${total_users} ;;
    value_format_name: percent_1
  }

  measure: new_user_ratio2 {
    group_label: "User"
    label: "新規ユーザー割合TEST"
    type: number
    sql: CASE
        WHEN ${total_users} = 0 THEN 0  -- total_users が 0 の場合は 0 を返す
        ELSE ${total_new_users} / ${total_users}
      END ;;
    value_format_name: percent_1
  }


  measure: total_repeat_users {
    group_label: "User"
    label: "リピーターユーザー数"
    type: number
    sql: ${total_users} - ${total_new_users} ;;
  }

  measure: repeat_user_ratio {
    group_label: "User"
    label: "リピーターユーザー割合"
    type: number
    sql: ${total_repeat_users} / ${total_users} ;;
    value_format_name: percent_1
  }


  # dimension: page_group {
  #   label: "ページパスグループ"
  #   type: string
  #   sql: CASE
  #       WHEN ${events_all__event_params.page_location} LIKE '%/hotels/kaisengokuhara%' OR ${events_all__event_params.page_location} LIKE '%/facilities/0000000124%' THEN '仙石原'
  #       WHEN ${events_all__event_params.page_location} LIKE '%/hotels/kaiporotp%' OR ${events_all__event_params.page_location} LIKE '%/facilities/0000000129%' THEN 'ポロト'
  #       ELSE 'その他'
  #     END;;
  # }

  dimension: page_group {
    label: "ページパスグループ"
    type: string
    sql: CASE
       WHEN ${events_all__event_params.page_location} LIKE '%/hotels/kaisengokuhara%' OR ${events_all__event_params.page_location} LIKE '%/facilities/0000000124%' THEN '仙石原'
       WHEN ${events_all__event_params.page_location} LIKE '%/hotels/kaiporoto%' OR ${events_all__event_params.page_location} LIKE '%/facilities/0000000129%' THEN 'ポロト'
       WHEN ${events_all__event_params.page_location} LIKE '%/facilities/%' THEN CONCAT('施設ID:', REGEXP_EXTRACT(${events_all__event_params.page_location}, '/facilities/([0-9]+)'))
       ELSE 'その他'
     END;;
  }

  measure: total_page_views {
    group_label: "Events"
    label: "ページビュー"
    description: "The total number of pageviews for the property."
    type: count
    filters: [event_name: "page_view"]
    value_format_name: decimal_0
    drill_fields: [event_date, page_group, total_page_views]
  }

  measure: total_cvs {
    group_label: "Events"
    label: "CV数"
    description: "The total number of pageviews for the property."
    type: count
    filters: [event_name: "completed"]
    value_format_name: decimal_1
    ## クリックしたときに[ドリルダウン]するフィールドを追加
    drill_fields: [event_date_yymmddhhmm, user_pseudo_id, events_all__event_params.page_location ,traffic_source__medium, total_cvs]
  }

  measure: pageviews_per_session {
    group_label: "Events"
    label: "セッションあたりのページビュー数"
    description: "1セッションあたりの平均ページビュー数"
    type: number
    sql: ${total_page_views} / ${events_all__event_params.session_count} ;;
    value_format_name: decimal_1
  }

  measure: conversion_rate {
    group_label: "Events"
    type: number
    sql: ${total_cvs} / ${events_all__event_params.session_count} ;;
    value_format_name: percent_2
  }



  #-------------------------------------------
  ## 任意の期間同士で相対比較する

  filter: duration1{
    label: "集計対象期間1"
    type: date
  }

  filter: duration2{
    label: "集計対象期間2"
    type: date
  }

  # measure: total_sales_duration1 {
  #   label: "ページビュー（期間１）"
  #   type: sum
  #   sql: CASE
  #         WHEN {% condition duration1 %}  TIMESTAMP(PARSE_DATE("%Y%m%d",${event_date}))  {% endcondition %}
  #         THEN 1
  #         ELSE 0
  #       END ;;
  #   value_format_name: pv
  # }

  # measure: total_sales_duration2 {
  #   label: "ページビュー（期間２）"
  #   type: sum
  #   sql: CASE
  #         WHEN {% condition duration2 %}  TIMESTAMP(PARSE_DATE("%Y%m%d",${event_date}))  {% endcondition %}
  #         THEN 1
  #         ELSE 0
  #       END ;;
  #   value_format_name: pv
  # }

  measure: total_page_views_duration1 {
    label: "ページビュー（集計対象期間1）"
    type: sum
    sql: CASE
        WHEN {% condition duration1 %} TIMESTAMP(PARSE_DATE("%Y%m%d",${event_date})) {% endcondition %}
        THEN CASE
               WHEN event_name = 'page_view' THEN 1  -- event_name が 'page_view' の場合
               WHEN EXISTS(SELECT 1 FROM UNNEST(event_params) WHERE key = 'page_view_type' AND value.int_value = 1) THEN 1  -- event_params に特定の条件を満たす要素が存在する場合
               ELSE 0
             END
        ELSE 0
      END ;;
    value_format_name: decimal_0
  }

  measure: total_page_views_duration2 {
    label: "ページビュー（集計対象期間２）"
    type: sum
    sql: CASE
        WHEN {% condition duration2 %} TIMESTAMP(PARSE_DATE("%Y%m%d",${event_date})) {% endcondition %}
        THEN CASE
               WHEN event_name = 'page_view' THEN 1  -- event_name が 'page_view' の場合
               WHEN EXISTS(SELECT 1 FROM UNNEST(event_params) WHERE key = 'page_view_type' AND value.int_value = 1) THEN 1  -- event_params に特定の条件を満たす要素が存在する場合
               ELSE 0
             END
        ELSE 0
      END ;;
    value_format_name: decimal_0
  }

  measure: page_views_change_rate {
    label: "ページビュー変化率 (期間1 - 期間2) / 期間2"
    description: "過去のデータ（期間２）と比較して、現状を評価：前年同月比、前週比など
    例：(期間１ - 期間２) / 期間1 = (150 - 100) / 100 = 0.5：期間２と比べて期間１は50%増加した"
    type: number
    sql: (${total_page_views_duration1} - ${total_page_views_duration2}) / ${total_page_views_duration2} ;;
    value_format_name: percent_1
  }

  #-------------------------------------------


  #-------------------------------------------


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      event_name,
      traffic_source__name,
      device__mobile_model_name,
      device__mobile_brand_name,
      device__web_info__hostname,
      event_dimensions__hostname,
      device__mobile_marketing_name,
      collected_traffic_source__manual_campaign_name
    ]
  }

}


###################################################################
# The name of this view in Looker is "Events all Items"
###################################################################
view: events_all__items {
  #sql_table_name: `hop4-analysis.analytics_410720616.events_*__items` ;;

  drill_fields: [item_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: item_id {
    primary_key: yes
    type: string
    sql: item_id ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Affiliation" in Explore.

  dimension: affiliation {
    type: string
    sql: affiliation ;;
  }

  dimension: coupon {
    type: string
    sql: coupon ;;
  }

  dimension: creative_name {
    type: string
    sql: creative_name ;;
  }

  dimension: creative_slot {
    type: string
    sql: creative_slot ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: events_all__items {
    type: string
    hidden: yes
    sql: events_all__items ;;
  }

  dimension: item_brand {
    type: string
    sql: item_brand ;;
  }

  dimension: item_category {
    type: string
    sql: item_category ;;
  }

  dimension: item_category2 {
    type: string
    sql: item_category2 ;;
  }

  dimension: item_category3 {
    type: string
    sql: item_category3 ;;
  }

  dimension: item_category4 {
    type: string
    sql: item_category4 ;;
  }

  dimension: item_category5 {
    type: string
    sql: item_category5 ;;
  }

  dimension: item_list_id {
    type: string
    sql: item_list_id ;;
  }

  dimension: item_list_index {
    type: string
    sql: item_list_index ;;
  }

  dimension: item_list_name {
    type: string
    sql: item_list_name ;;
  }

  dimension: item_name {
    type: string
    sql: item_name ;;
  }

  dimension: item_params {
    hidden: yes
    sql: item_params ;;
  }

  dimension: item_refund {
    type: number
    sql: item_refund ;;
  }

  dimension: item_refund_in_usd {
    type: number
    sql: item_refund_in_usd ;;
  }

  dimension: item_revenue {
    type: number
    sql: item_revenue ;;
  }

  dimension: item_revenue_in_usd {
    type: number
    sql: item_revenue_in_usd ;;
  }

  dimension: item_variant {
    type: string
    sql: item_variant ;;
  }

  dimension: location_id {
    type: string
    sql: location_id ;;
  }

  dimension: price {
    type: number
    sql: price ;;
  }

  dimension: price_in_usd {
    type: number
    sql: price_in_usd ;;
  }

  dimension: promotion_id {
    type: string
    sql: promotion_id ;;
  }

  dimension: promotion_name {
    type: string
    sql: promotion_name ;;
  }

  dimension: quantity {
    type: number
    sql: quantity ;;
  }
}

###################################################################
# The name of this view in Looker is "Events all Event Params"
###################################################################ß
view: events_all__event_params {

  #-------------------------------------------
  # view: events_all__event_paramsのprimary_keyを定義
  dimension: id {
    primary_key: yes
    hidden: yes
    sql: CONCAT(CAST(${key} AS STRING),'|', CAST(${offset} AS STRING))  ;;
  }

  dimension: offset {
    type: number
    sql:  events_all__event__params_offset;;
  }
  #-------------------------------------------


  dimension: events_all__event_params {
    type: string
    hidden: yes
    sql: events_all__event_params ;;
  }

  dimension: key {
    full_suggestions: yes
    type: string
    sql: key ;;
  }

  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }

  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }

  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }

  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }

  measure: count {
    type: count
  }

  measure: session_count {
    label: "セッション数"
    type: count_distinct
    sql: ${value__int_value} ;;
    filters: [key: "ga_session_id"]
    value_format_name: decimal_0
    drill_fields: [events_all.event_date, events_all.page_group, session_count_by_group]
  }

# 各グループ別のセッション数を正確に表示するための新しいメジャー
  measure: session_count_by_group {
    label: "グループ別セッション数"
    description: "各ページグループ内でのセッション数（セッションの重複あり）"
    type: count_distinct
    sql: ${value__int_value} ;;
    filters: [key: "ga_session_id"]
    value_format_name: decimal_0
  }


  dimension: page_location {
    label: "ページロケーション別"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "page_location") ;;
    full_suggestions: yes
  }

  dimension: journey_id_start_value {
    type: string
    sql: CASE WHEN ${key} = 'journey_id_start' THEN ${value__string_value} ELSE NULL END;;
  }

  # measure: total_sales_duration1 {
  #   label: "セッション（期間１）"
  #   type: sum
  #   sql: CASE
  #       WHEN {% condition duration1 %} TIMESTAMP(${events_all.event_date}) {% endcondition %}
  #       THEN COUNT(DISTINCT ${value__int_value})
  #       ELSE 0
  #     END ;;
  #   filters: [key: "ga_session_id"]
  #   value_format_name: session
  # }

  # measure: total_sales_duration2 {
  #   label: "セッション（期間２）"
  #   type: sum
  #   sql: CASE
  #       WHEN {% condition duration2 %} TIMESTAMP(${events_all.event_date}) {% endcondition %}
  #       THEN COUNT(DISTINCT ${value__int_value})
  #       ELSE 0
  #     END ;;
  #   filters: [key: "ga_session_id"]
  #   value_format_name: session
  # }


}
###################################################################
# The name of this view in Looker is "Events all User Properties"
###################################################################
view: events_all__user_properties {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: events_all__user_properties {
    type: string
    hidden: yes
    sql: events_all__user_properties ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }

  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }

  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }

  dimension: value__set_timestamp_micros {
    type: number
    sql: ${TABLE}.value.set_timestamp_micros ;;
    group_label: "Value"
    group_item_label: "Set Timestamp Micros"
  }

  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}

# The name of this view in Looker is "Events all Items Item Params"
view: events_all__items__item_params {

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }

  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }

  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }

  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}


# view: ga {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
