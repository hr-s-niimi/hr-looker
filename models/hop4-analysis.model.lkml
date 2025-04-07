# Define the database connection to be used for this model.
connection: "hop4-analysis"

# include all the views
include: "/views/**/*.view.lkml"


explore: events_all {
  label: "events"
  join: events_all__items {
    view_label: "Events: Items"
    sql: LEFT JOIN UNNEST(${events_all.items}) as events_all__items ;;
    relationship: one_to_many
  }
  #-------------------------------------------
  # join: events_all__event_params {
  #   view_label: "Events: Event Params"
  #   sql: LEFT JOIN UNNEST(${events_all.event_params}) as events_all__event_params ;;
  #   relationship: one_to_many
  # }
  join: events_all__event_params {
    view_label: "Events: Event Params"
    sql: LEFT JOIN UNNEST(${events_all.event_params}) as events_all__event_params WITH OFFSET as events_all__event__params_offset;;
    relationship: one_to_many
  }
  #-------------------------------------------
  # join: 000_events_all__user_properties {
  #   view_label: "Events 20231228: User Properties"
  #   sql: LEFT JOIN UNNEST(${000_events_all.user_properties}) as 000_events_all__user_properties ;;
  #   relationship: one_to_many
  # }
  # join: 000_events_all__items__item_params {
  #   view_label: "Events 20231228: Items Item Params"
  #   sql: LEFT JOIN UNNEST(${000_events_all__items.item_params}) as 000_events_all__items__item_params ;;
  #   relationship: one_to_many
  # }
}


explore: ga4_events_completed_to_journey_id_465873131{
  label: "ga4_events_completed_to_journey_id_465873131"
}

explore: tabirakiu_ygets_ab_test_model{
  label: "tabirakiu_ygets_ab_test_model"
}
