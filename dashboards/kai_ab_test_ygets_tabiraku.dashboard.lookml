---
- dashboard: kai_ab_test_ygets_tabiraku
  title: AB_Testing（仙石原）
  description: ''
  preferred_slug: pNWca1Px3XA83ztWYdpM8L
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: CVR日別比較
    name: CVR日別比較
    model: hop4-analysis
    explore: tabirakiu_ygets_ab_test_model
    type: looker_grid
    fields: [tabirakiu_ygets_ab_test_model.date_date, tabirakiu_ygets_ab_test_model.actual_cvr_tabiraku,
      tabirakiu_ygets_ab_test_model.predicted_cvr_ygets]
    sorts: [tabirakiu_ygets_ab_test_model.date_date]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Month Formatted: tabirakiu_ygets_ab_test_model.date_month_formatted
    row: 18
    col: 0
    width: 24
    height: 14
    tab_name: ''
  - title: 無題
    name: 無題
    model: hop4-analysis
    explore: tabirakiu_ygets_ab_test_model
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [tabirakiu_ygets_ab_test_model.average_actual_cvr_tabiraku]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    note_state: collapsed
    note_display: hover
    note_text: |-
      あああああああああ
      あああああああああ
    title_hidden: true
    listen:
      Date Month Formatted: tabirakiu_ygets_ab_test_model.date_month_formatted
    row: 6
    col: 0
    width: 12
    height: 3
    tab_name: ''
  - title: 無題 (コピー)
    name: 無題 (コピー)
    model: hop4-analysis
    explore: tabirakiu_ygets_ab_test_model
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [tabirakiu_ygets_ab_test_model.average_predicted_cvr_ygets]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    title_hidden: true
    listen:
      Date Month Formatted: tabirakiu_ygets_ab_test_model.date_month_formatted
    row: 6
    col: 12
    width: 12
    height: 3
    tab_name: ''
  - name: ここはまだダミーです「CVR改善による費用対効果」
    type: text
    title_text: ここはまだダミーです「CVR改善による費用対効果」
    subtitle_text: ''
    body_text: "### <center> たびらくCVR改善で、 累計 ＊＊＊＊円 の収益寄与 </center>"
    row: 32
    col: 0
    width: 24
    height: 4
    tab_name: ''
  - title: CVR推移比較
    name: CVR推移比較
    model: hop4-analysis
    explore: tabirakiu_ygets_ab_test_model
    type: looker_line
    fields: [tabirakiu_ygets_ab_test_model.average_actual_cvr_tabiraku, tabirakiu_ygets_ab_test_model.average_predicted_cvr_ygets,
      tabirakiu_ygets_ab_test_model.date_date]
    fill_fields: [tabirakiu_ygets_ab_test_model.date_date]
    sorts: [tabirakiu_ygets_ab_test_model.date_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
        reverse: false
    y_axes: [{label: CVR, orientation: right, series: [{axisId: tabirakiu_ygets_ab_test_model.average_actual_cvr_tabiraku,
            id: tabirakiu_ygets_ab_test_model.average_actual_cvr_tabiraku, name: tabiraku
              cvr}, {axisId: tabirakiu_ygets_ab_test_model.average_predicted_cvr_ygets,
            id: tabirakiu_ygets_ab_test_model.average_predicted_cvr_ygets, name: ygets
              cvr}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    label_value_format: ''
    series_colors:
      tabirakiu_ygets_ab_test_model.average_predicted_cvr_ygets: "#ffd54d"
    series_labels:
      tabirakiu_ygets_ab_test_model.average_actual_cvr_tabiraku: tabiraku cvr
      tabirakiu_ygets_ab_test_model.average_predicted_cvr_ygets: ygets cvr
    swap_axes: false
    discontinuous_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    listen:
      Date Month Formatted: tabirakiu_ygets_ab_test_model.date_month_formatted
    row: 9
    col: 0
    width: 24
    height: 9
    tab_name: ''
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div class="sidebar" style="width: 100%; background: #293949">
        <div>
          <ul style="margin: 0; padding: 0; display: flex">
            <li
              style="align-items: center; display: flex; padding: 15px 10px 15px 20px"
            >
              <a href="https://hoshinoresorts.cloud.looker.com/dashboards/14">
                <img
                  src="https://storage.cloud.google.com/aseets/logo.png"
                  style="max-width: 170px; margin-top: -3px"
                />
              </a>
            </li>
            <li
              style="
                list-style-type: none;
                border-bottom: 1px solid rgba(255, 255, 255, 0.05);
              "
            >
              <a
                href="https://hoshinoresorts.cloud.looker.com/dashboards/16"
                style="
                  color: #c0c3c8;
                  text-decoration: none;
                  display: block;
                  padding: 18px 10px;
                  font-size: 12px;
                  outline: 0;
                "
              >
                <span>
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="36"
                    height="36"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="ai ai-TriangleRight"
                    style="
                      height: 16px;
                      vertical-align: middle;
                      margin-top: -3px;
                      width: 25px;
                    "
                  >
                    <path d="M17 12L9 6v12l8-6z" />
                  </svg>
                  メディア別レポート
                </span>
              </a>
            </li>
            <li
              style="
                list-style-type: none;
                border-bottom: 1px solid rgba(255, 255, 255, 0.05);
              "
            >
              <a
                href="https://hoshinoresorts.cloud.looker.com/dashboards/13"
                style="
                  color: #c0c3c8;
                  text-decoration: none;
                  display: block;
                  padding: 18px 10px;
                  font-size: 12px;
                  outline: 0;
                "
              >
                <span>
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="36"
                    height="36"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="ai ai-TriangleRight"
                    style="
                      height: 16px;
                      vertical-align: middle;
                      margin-top: -3px;
                      width: 25px;
                    "
                  >
                    <path d="M17 12L9 6v12l8-6z" />
                  </svg>
                  CVタッチポイント分析
                </span>
              </a>
            </li>
            <li
              style="
                list-style-type: none;
                border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                margin-left: auto;
              "
            >
              <a
                href="https://hoshinoresorts.cloud.looker.com/dashboards/12"
                style="
                  color: #1abc9c;
                  text-decoration: none;
                  display: block;
                  padding: 18px 20px 18px 10px;
                  font-size: 12px;
                  outline: 0;
                "
              >
                <span>
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="36"
                    height="36"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="ai ai-Newspaper"
                    style="
                      height: 16px;
                      vertical-align: middle;
                      margin-top: -3px;
                      width: 25px;
                    "
                  >
                    <path
                      d="M5 21h12a4 4 0 0 0 4-4V5a2 2 0 0 0-2-2H9a2 2 0 0 0-2 2v13c0 1.657-.343 3-2 3z"
                    ></path>
                    <path
                      d="M3 10a2 2 0 0 1 2-2h2v10.5c0 1.38-.62 2.5-2 2.5s-2-1.12-2-2.5V10z"
                    ></path>
                    <circle cx="12" cy="8" r="1"></circle>
                    <path d="M11 14h6"></path>
                    <path d="M11 17h3"></path>
                  </svg>
                  ABテスト統計分析
                </span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border: solid 1px #1A73E8; border-radius: 5px; padding: 3px 10px; background: #eaf1fe;  margin-bottom: 10px;">
      <p style="text-align: center;">機械学習と統計モデルを用いて、たびらく｜宿GETSが同一期間で稼働している場合の予測データを作成し、成果指標となるCVRを評価する</p>
      <p>BigQueryMLのモデルタイプで、過去のデータから未来の予測に適している回帰分析「BOOSTED_TREE_REGRESSOR」を選択。
      線形回帰モデルでは捉えにくい季節変動やマクロ要因（経済全体や社会全体の影響）を、Boosted Tree(ブースティング決定木モデル)を選択する事で予測精度を向上する。
      また、Boosted Treeモデルは欠損値を扱うことができるため、異常値への対応が期待できる。</p>
      </div>
    row: 2
    col: 0
    width: 24
    height: 4
    tab_name: ''
  filters:
  - name: Date Month Formatted
    title: Date Month Formatted
    type: field_filter
    default_value: 2025年04月
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: hop4-analysis
    explore: tabirakiu_ygets_ab_test_model
    listens_to_filters: []
    field: tabirakiu_ygets_ab_test_model.date_month_formatted
