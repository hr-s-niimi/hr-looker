# ============================================================
# 食事オプション変更 - 拡張 view (意味層)
# 基底 view (flebol_meal_options) に業務ラベル・派生 dim・measure を追加。
# brand_name は facility_master join(explore 側で定義)を required_joins で参照。
# ============================================================
include: "/views/revenue_radar/flebol_meal_options.view.lkml"
include: "/views/revenue_radar/facility_master.view.lkml"

view: +flebol_meal_options {
  view_label: "食事オプション"

  # ---------- 施設・ブランド (facility_master join を参照) ----------
  dimension: brand_name {
    label: "ブランド"
    group_label: "施設"
    type: string
    required_joins: [facility_master]
    sql: CASE
           WHEN ${facility_master.brands} IN ('星のや', '界', 'OMO', 'BEB', 'LUCY') THEN ${facility_master.brands}
           WHEN ${facility_master.brands} IS NOT NULL THEN 'その他'
           ELSE 'マスタ未登録'
         END ;;
  }
  dimension: is_target_brand {
    label: "分析対象ブランド"
    group_label: "施設"
    type: yesno
    required_joins: [facility_master]
    sql: ${brand_name} IN ('星のや', '界', 'OMO', 'BEB', 'LUCY') ;;
  }

  # ---------- 食事区分ラベル ----------
  dimension: meal_label {
    label: "食事"
    group_label: "食事オプション"
    type: string
    sql: CASE ${meal} WHEN 'DINNER' THEN '夕食'
                      WHEN 'BREAKFAST' THEN '朝食'
                      ELSE ${meal} END ;;
  }

  # ---------- measures (人数ベース) ----------
  measure: net_guests {
    label: "純増減人数"
    description: "Σ(qtyAfter-qtyBefore)。option_name で group = そのオプションの純増減(増-減)人数"
    type: sum
    sql: ${TABLE}.quantity_diff ;;
  }
  measure: increased_guests {
    label: "増えた人数(延べ)"
    description: "KPI『総/夕食/朝食で変更』はこれを meal で絞る"
    type: sum
    sql: GREATEST(${TABLE}.quantity_diff, 0) ;;
  }
  measure: decreased_guests {
    label: "減った人数(延べ)"
    type: sum
    sql: LEAST(${TABLE}.quantity_diff, 0) ;;
  }
  measure: quantity_before_total {
    label: "変更前 人数(合計)"
    type: sum
    sql: ${TABLE}.quantity_before ;;
  }
  measure: quantity_after_total {
    label: "変更後 人数(合計)"
    type: sum
    sql: ${TABLE}.quantity_after ;;
  }
}
