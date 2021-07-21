- dashboard: multicloud_billing
  title: 'Cloud Billing: Phase 1'
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: DAILY SPEND
    title: DAILY SPEND
    merged_queries:
    - model: gcp_billing_block
      explore: gcp_billing_export
      type: table
      fields: [gcp_billing_export.usage_start_date, gcp_billing_export.total_cost]
      fill_fields: [gcp_billing_export.usage_start_date]
      filters:
      sorts: [gcp_billing_export.usage_start_date desc]
      limit: 500
      join_fields: []
    - model: azure_billing_block
      explore: azure_billing
      type: table
      fields: [azure_billing.total_pre_tax_cost, azure_billing.usage_date_time_date]
      fill_fields: [azure_billing.usage_date_time_date]
      filters:
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: azure_billing.usage_date_time_date
        source_field_name: gcp_billing_export.usage_start_date
    - model: aws_billing_block
      explore: aws_billing
      type: table
      fields: [aws_billing.total_blended_cost, aws_billing.usage_start_date]
      fill_fields: [aws_billing.usage_start_date]
      filters:
      sorts: [aws_billing.usage_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: aws_billing.usage_start_date
        source_field_name: gcp_billing_export.usage_start_date
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Total Cost, orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: GCP}, {axisId: azure_billing.total_pre_tax_cost,
            id: azure_billing.total_pre_tax_cost, name: Azure}, {axisId: aws_billing.total_blended_cost,
            id: aws_billing.total_blended_cost, name: AWS}], showLabels: true, showValues: true,
        valueFormat: '[<1000000]$0,"K";$0,,"M"', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 5, type: linear}]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    label_value_format: $0,"K"
    series_types:
      total_cost: line
      total_cloud_cost: line
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#34A853"
      azure_billing.total_pre_tax_cost: "#00A2ED"
      total_cost: transparent
      total_cloud_cost: transparent
      aws_billing.total_blended_cost: "#FF9900"
    series_labels:
      gcp_billing_export.total_cost: GCP
      azure_billing.total_pre_tax_cost: Azure
      aws_billing.total_blended_cost: AWS
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: range, line_value: mean, label_position: right,
        color: "#ababab", range_start: '1300000', range_end: '10000000', label: Over
          Budget, margin_value: '80000', margin_top: '10000', margin_bottom: '0'}]
    trend_lines: []
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_column
    hidden_fields:
    column_limit: 50
    listen:
    - DATE: gcp_billing_export.usage_start_date
    - DATE: azure_billing.usage_date_time_date
    - DATE: aws_billing.usage_start_date
    row: 2
    col: 5
    width: 19
    height: 10
  - title: GCP
    name: GCP
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_cost]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Total Cost}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      gcp_billing_export.total_cost: "#34A853"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: false
    show_null_points: false
    interpolation: monotone
    discontinuous_nulls: false
    single_value_title: GCP
    value_format: '[>=1000000]$0.00,,"M";$0.0,"K"'
    conditional_formatting: [{type: not equal to, value: -999, background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-diverging-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      DATE: gcp_billing_export.usage_start_date
    row: 6
    col: 0
    width: 5
    height: 2
  - name: TOTAL CLOUD COST
    title: TOTAL CLOUD COST
    merged_queries:
    - model: aws_billing_block
      explore: aws_billing
      type: table
      fields: [aws_billing.total_blended_cost, merge]
      filters:
      limit: 500
      dynamic_fields: [{dimension: merge, _kind_hint: dimension, _type_hint: number,
          category: dimension, expression: '1', label: MERGE, value_format: !!null '',
          value_format_name: !!null ''}]
      join_fields: []
    - model: azure_billing_block
      explore: azure_billing
      type: table
      fields: [azure_billing.total_pre_tax_cost, merge]
      filters:
      limit: 500
      dynamic_fields: [{dimension: merge, _kind_hint: dimension, _type_hint: number,
          category: dimension, expression: '1', label: MERGE, value_format: !!null '',
          value_format_name: !!null ''}]
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: merge
        source_field_name: merge
    - model: gcp_billing_block
      explore: gcp_billing_export
      type: table
      fields: [merge, gcp_billing_export.total_cost]
      filters:
      limit: 500
      dynamic_fields: [{dimension: merge, _kind_hint: dimension, _type_hint: number,
          category: dimension, expression: '1', label: MERGE, value_format: !!null '',
          value_format_name: !!null ''}]
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: merge
        source_field_name: merge
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color_enabled: true
    custom_color: "#FFF"
    show_single_value_title: true
    single_value_title: TOTAL CLOUD COST
    value_format: '[>=1000000]$0.00,,"M";$0.0,"K"'
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: not equal to, value: -999, background_color: "#9AA0A6",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [aws_billing.total_blended_cost, azure_billing.total_pre_tax_cost,
      gcp_billing_export.total_cost, aws, azure, gcp]
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cloud_cost, _type_hint: number,
        category: table_calculation, expression: "${aws_billing.total_blended_cost}+${gcp_billing_export.total_cost}+${azure_billing.total_pre_tax_cost}",
        label: Total Cloud Cost, value_format: !!null '', value_format_name: usd_0},
      {_kind_hint: measure, table_calculation: aws, _type_hint: number, category: table_calculation,
        expression: "${aws_billing.total_blended_cost}/${total_cloud_cost}", label: AWS%,
        value_format: !!null '', value_format_name: percent_0}, {_kind_hint: measure,
        table_calculation: gcp, _type_hint: number, category: table_calculation, expression: "${gcp_billing_export.total_cost}/${total_cloud_cost}",
        label: GCP%, value_format: !!null '', value_format_name: percent_0}, {_kind_hint: measure,
        table_calculation: azure, _type_hint: number, category: table_calculation,
        expression: "${azure_billing.total_pre_tax_cost}/${total_cloud_cost}", label: AZURE%,
        value_format: !!null '', value_format_name: percent_0}, {_kind_hint: measure,
        table_calculation: percentages, _type_hint: string, category: table_calculation,
        expression: 'concat("GCP: ",round(${gcp}*100,0),"% | AZURE: ",round(${azure}*100,0),"%
          | AWS: ",round(${aws}*100,0),"%")', label: Percentages, value_format: !!null '',
        value_format_name: !!null ''}]
    listen:
    - DATE: aws_billing.usage_start_date
    - DATE: azure_billing.usage_date_time_date
    - DATE: gcp_billing_export.usage_start_date
    row: 2
    col: 0
    width: 5
    height: 4
  - title: AZURE
    name: AZURE
    model: azure_billing_block
    explore: azure_billing
    type: single_value
    fields: [azure_billing.total_pre_tax_cost]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    single_value_title: AZURE
    value_format: '[>=1000000]$0.0,,"M";$0.0,"K"'
    conditional_formatting: [{type: not equal to, value: -999, background_color: "#00A2ED",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-diverging-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      DATE: azure_billing.usage_date_time_date
    row: 8
    col: 0
    width: 5
    height: 2
  - title: AWS
    name: AWS
    model: aws_billing_block
    explore: aws_billing
    type: single_value
    fields: [aws_billing.total_blended_cost]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: AWS
    value_format: '[>=1000000]$0.0,,"M";$0.0,"K"'
    conditional_formatting: [{type: not equal to, value: -999, background_color: "#FF9900",
        font_color: "#FFF", color_application: {collection_id: google, palette_id: google-diverging-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      DATE: aws_billing.usage_start_date
    row: 10
    col: 0
    width: 5
    height: 2
  - name: "<b>OVERVIEW</b>"
    type: text
    title_text: "<b>OVERVIEW</b>"
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: TOP BILLED SERVICES
    title: TOP BILLED SERVICES
    merged_queries:
    - model: marketplace_multicloud_billing
      explore: cloud
      type: table
      fields: [cloud.cloud]
      sorts: [cloud.cloud]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: azure_billing_block
      explore: azure_billing
      type: table
      fields: [azure_billing.cloud, azure_billing.service_name, azure_billing.total_pre_tax_cost]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: azure_billing.cloud
        source_field_name: cloud.cloud
    - model: gcp_billing_block
      explore: gcp_billing_export
      type: table
      fields: [gcp_billing_export.cloud, gcp_billing_export.total_cost, gcp_billing_export.service__description]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: gcp_billing_export.cloud
        source_field_name: cloud.cloud
    - model: aws_billing_block
      explore: aws_billing
      type: table
      fields: [aws_billing.cloud, aws_billing.product_name, aws_billing.total_blended_cost]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: aws_billing.cloud
        source_field_name: cloud.cloud
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Cost, orientation: left, series: [{axisId: azure_billing.total_pre_tax_cost,
            id: azure_billing.total_pre_tax_cost, name: Azure}, {axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: GCP}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '35'
    legend_position: center
    label_value_format: '[>1000000]$0.0,,"M";$0,"K"'
    series_types: {}
    point_style: none
    series_colors:
      azure_billing.total_pre_tax_cost: "#00A2ED"
      gcp_billing_export.total_cost: "#34A853"
      aws_billing.total_blended_cost: "#FF9900"
    series_labels:
      azure_billing.total_pre_tax_cost: Azure
      gcp_billing_export.total_cost: GCP
      aws_billing.total_blended_cost: AWS
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [total_cost, azure_billing.service_name, gcp_billing_export.service__description,
      cloud.cloud, aws_billing.product_name]
    type: looker_bar
    sorts: [total_cost desc]
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: 'if(${cloud.cloud}="GCP",${gcp_billing_export.total_cost},if(${cloud.cloud}="AWS",${aws_billing.total_blended_cost},${azure_billing.total_pre_tax_cost}))',
        label: Total Cost, value_format: !!null '', value_format_name: usd_0}, {_kind_hint: dimension,
        table_calculation: service, _type_hint: string, category: table_calculation,
        expression: 'if(${cloud.cloud}="GCP",${gcp_billing_export.service__description},if(${cloud.cloud}="AWS",${aws_billing.product_name},${azure_billing.service_name}))',
        label: Service, value_format: !!null '', value_format_name: !!null ''}]
    listen:
    -
    - DATE: azure_billing.usage_date_time_date
    - DATE: gcp_billing_export.usage_start_date
    - DATE: aws_billing.usage_start_date
    row: 14
    col: 0
    width: 11
    height: 25
  - name: "<b>BREAKDOWN</b>"
    type: text
    title_text: "<b>BREAKDOWN</b>"
    subtitle_text: ''
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 2
  - title: 'TOP GCP BILLED PROJECTS '
    name: 'TOP GCP BILLED PROJECTS '
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_waterfall
    fields: [gcp_billing_export.project__name, gcp_billing_export.total_cost]
    sorts: [gcp_billing_export.total_cost desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: "${gcp_billing_export.total_cost}+0", label: Total
          Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"', value_format_name: !!null ''}]
    query_timezone: America/Los_Angeles
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: false
    y_axis_gridlines: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    label_color: ["#FFF"]
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [gcp_billing_export.total_cost]
    listen:
      DATE: gcp_billing_export.usage_start_date
    row: 14
    col: 11
    width: 13
    height: 9
  - title: 'TOP AZURE BILLED RESOURCES '
    name: 'TOP AZURE BILLED RESOURCES '
    model: azure_billing_block
    explore: azure_billing
    type: looker_waterfall
    fields: [azure_billing.total_pre_tax_cost, azure_billing.resource_group]
    sorts: [azure_billing.total_pre_tax_cost desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: "${azure_billing.total_pre_tax_cost}",
        label: Total Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"', value_format_name: !!null ''}]
    up_color: "#00A2ED"
    down_color: "#EA4335"
    total_color: "#9AA0A6"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: false
    y_axis_gridlines: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    label_color: [white]
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [azure_billing.total_pre_tax_cost]
    listen:
      DATE: azure_billing.usage_date_time_date
    row: 23
    col: 11
    width: 13
    height: 8
  - title: TOP AWS BILLED RESOURCES
    name: TOP AWS BILLED RESOURCES
    model: aws_billing_block
    explore: aws_billing
    type: looker_waterfall
    fields: [aws_billing.total_blended_cost, aws_billing.resource_id]
    sorts: [aws_billing.total_blended_cost desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{dimension: linked_account_region, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'concat(${aws_billing.linked_account_id},"
          - ",if(is_null(${aws_billing.availability_zone}),"no-region",${aws_billing.availability_zone}))',
        label: Linked Account - Region, value_format: !!null '', value_format_name: !!null ''},
      {_kind_hint: measure, table_calculation: total_cost, _type_hint: number, category: table_calculation,
        expression: "${aws_billing.total_blended_cost}+0", label: Total Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"',
        value_format_name: !!null ''}]
    up_color: "#FF9900"
    down_color: false
    total_color: "#9AA0A6"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: false
    y_axis_gridlines: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    label_color: [white]
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [aws_billing.total_blended_cost]
    listen:
      DATE: aws_billing.usage_start_date
    row: 31
    col: 11
    width: 13
    height: 8
  filters:
  - name: DATE
    title: DATE
    type: field_filter
    default_value: 90 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.usage_start_date
  - name: SERVICE AREA (PHASE 2)
    title: SERVICE AREA (PHASE 2)
    type: field_filter
    default_value: All
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: marketplace_multicloud_billing
    explore: cloud
    listens_to_filters: []
    field: cloud.service_category
  - name: COST CENTER (PHASE 3)
    title: COST CENTER (PHASE 3)
    type: field_filter
    default_value: All
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: marketplace_multicloud_billing
    explore: cloud
    listens_to_filters: []
    field: cloud.cost_center
  - name: TAG & LABEL LOOKUP (PHASE 3)
    title: TAG & LABEL LOOKUP (PHASE 3)
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: TAG & LABEL VALUE (PHASE 3)
    title: TAG & LABEL VALUE (PHASE 3)
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
