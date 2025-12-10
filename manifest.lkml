project_name: "hop4-analysis"

application: hop4-analysis {
  label: "HR Extension"

  # --- ▼ 開発する時はこちらを有効にする (localhost) ---
  url: "https://localhost:8080/bundle.js"

  # --- ▼ リリースする時はこちらを有効にする (本番ファイル) ---
  # file: "bundle.js"

  # 必要な権限（最低限の設定）
  entitlements: {
    core_api_methods: ["me"]
    use_embeds: yes
  }
}
