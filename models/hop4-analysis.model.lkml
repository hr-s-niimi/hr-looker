# Define the database connection to be used for this model.
connection: "hr-looker-application"

# include all the views
include: "/views/**/*.view.lkml"

explore: tabirakiu_ygets_ab_test_model{
  label: "tabirakiu_ygets_ab_test_model"
}
