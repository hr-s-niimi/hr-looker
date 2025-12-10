project_name: "hop4-analysis"

application: hop4-analysis {
  label: "HR Extension"

  # --- ▼ 開発する時はこちらを有効にする (localhost) ---
  url: "https://localhost:8080/bundle.js"

  # --- ▼ リリースする時はこちらを有効にする (本番ファイル) ---
  # file: "bundle.js"

  entitlements: {
    # 現在のコードで必要なAPI権限（これだけでOKです）
    core_api_methods: ["all_lookml_models"]

    # ダッシュボード埋め込み等に使用
    use_embeds: yes

    # 新しいタブでリンクを開くために必須の設定
    new_window: yes
    new_window_external_urls: ["https://hoshinoresorts.cloud.looker.com"]
  }
}
