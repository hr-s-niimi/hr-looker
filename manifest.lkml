project_name: "hop4-analysis"

# ─── 本番 ───
application: revenue_radar {
  label: "Revenue Radar"
  file: "bundle.js"

  entitlements: {
    core_api_methods: ["me", "run_inline_query"]
    local_storage: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
  }
}

# ─── 開発 ───
application: revenue_radar_dev {
  label: "Revenue Radar (Dev)"
  url: "https://localhost:8080/bundle.js"

  entitlements: {
    core_api_methods: ["me", "run_inline_query"]
    local_storage: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
  }
}
