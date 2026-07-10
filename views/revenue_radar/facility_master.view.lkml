# ============================================================
# 施設マスタ (Hoshino Resorts 全施設)
# ソース: hop4-analysis.hr_master.facility_master
# 全 Revenue Radar view から facility_id 経由で参照される
# ============================================================

view: facility_master {
  sql_table_name: `hop4-analysis.hr_master.facility_master` ;;

  # ==================== primary key ====================
  dimension: facility_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.facility_id ;;
  }

  # ==================== 素の dimension ====================
  dimension: brands {
    type: string
    sql: ${TABLE}.brands ;;
  }

  dimension: facility_name {
    type: string
    sql: ${TABLE}.facility_name ;;
  }

  dimension: facility_slug {
    type: string
    sql: ${TABLE}.facility_slug ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: room_count {
    type: number
    sql: ${TABLE}.room_count ;;
  }

  # ==================== measure ====================
  measure: count {
    type: count
    drill_fields: [facility_id, facility_name, brands]
  }
}
