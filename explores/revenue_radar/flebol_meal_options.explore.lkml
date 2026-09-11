# ============================================================
# Explore: Meal Options (食事オプション変更・人数ベース)
# meal-option 粒度専用。change-event 系(booking_variance)とは分離し fan-out を回避。
# ============================================================
include: "/views/revenue_radar/flebol_meal_options.view.lkml"
include: "/views/revenue_radar/ref_flebol_meal_options.view.lkml"
include: "/views/revenue_radar/facility_master.view.lkml"

explore: flebol_meal_options {
  label: "Meal Options"
  description: "食事オプション変更の人数ベース集計 (optionName 別 純増減)"

  join: facility_master {
    view_label: "施設マスタ"
    relationship: many_to_one
    sql_on: ${flebol_meal_options.facility_code} = ${facility_master.facility_id} ;;
  }
}
