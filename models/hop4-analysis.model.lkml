# Define the database connection to be used for this model.
connection: "hop4-analysis"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

# datagroup: hop4-analysis_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

# persist_with: hop4-analysis_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Hop4-analysis"


explore: events_all {
  join: events_all__items {
    view_label: "Events: Items"
    sql: LEFT JOIN UNNEST(${events_all.items}) as events_all__items ;;
    relationship: one_to_many
  }
  join: events_all__event_params {
    view_label: "Events: Event Params"
    sql: LEFT JOIN UNNEST(${events_all.event_params}) as events_all__event_params ;;
    relationship: one_to_many
  }
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


# explore: events_20231228 {
#   join: events_20231228__items {
#     view_label: "Events 20231228: Items"
#     sql: LEFT JOIN UNNEST(${events_20231228.items}) as events_20231228__items ;;
#     relationship: one_to_many
#   }
#   join: events_20231228__event_params {
#     view_label: "Events 20231228: Event Params"
#     sql: LEFT JOIN UNNEST(${events_20231228.event_params}) as events_20231228__event_params ;;
#     relationship: one_to_many
#   }
#   join: events_20231228__user_properties {
#     view_label: "Events 20231228: User Properties"
#     sql: LEFT JOIN UNNEST(${events_20231228.user_properties}) as events_20231228__user_properties ;;
#     relationship: one_to_many
#   }
#   join: events_20231228__items__item_params {
#     view_label: "Events 20231228: Items Item Params"
#     sql: LEFT JOIN UNNEST(${events_20231228__items.item_params}) as events_20231228__items__item_params ;;
#     relationship: one_to_many
#   }
# }
