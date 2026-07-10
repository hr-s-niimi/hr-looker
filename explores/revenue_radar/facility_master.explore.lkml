# ============================================================
# Explore: Facility Master (施設マスタ単体クエリ用)
# アプリの施設 dropdown 等でマスタ全体を取得するために使用
# ============================================================

include: "/views/revenue_radar/facility_master.view.lkml"

explore: facility_master {
  label: "Facility Master"
  description: "施設マスタ (dropdown / lookup 用)"
}
