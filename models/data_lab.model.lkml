# Define the database connection to be used for this model.
connection: "hr-looker-application"

include: "/views/**/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

explore: tabirakiu_ygets_ab_test_model{
  label: "tabirakiu_ygets_ab_test_model"
}
