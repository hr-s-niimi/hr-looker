project_name: "hop4-analysis"

application: hop4-analysis {
  label: "My First Extension"
  # ここで先ほど成功したローカルのURLを指定します
  url: "https://localhost:8080/bundle.js"

  # 必要な権限（最低限の設定）
  entitlements: {
    core_api_methods: ["me"]
    use_embeds: yes
  }
}
