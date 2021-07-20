connection: "@{MULTICLOUD_DASHBOARD_CONNECTION}"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/dashboards/*"
explore: cloud {}
