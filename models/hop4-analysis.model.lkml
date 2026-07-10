# Define the database connection to be used for this model.
connection: "hop4-analysis"

# include all the views
include: "/views/**/*.view.lkml"

explore: tabirakiu_ygets_ab_test_model{
  label: "tabirakiu_ygets_ab_test_model"
}
