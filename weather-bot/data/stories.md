## happy path
* greet
  - utter_greet
* mood_great
  - utter_happy

## hello world path
*hello_world
  -action_hello_world
  
  
## sad path 1
* greet
  - utter_greet
* mood_unhappy
  - utter_cheer_up
  - utter_did_that_help
* affirm
  - utter_happy

## sad path 2
* greet
  - utter_greet
* mood_unhappy
  - utter_cheer_up
  - utter_did_that_help
* deny
  - utter_goodbye

## say goodbye
* goodbye
  - utter_goodbye

## bot challenge
* bot_challenge
  - utter_iamabot

## search restaurant path
* search_restaurant
  - action_search_restaurant
  
## weather report path
* weather_report
  -action_weather_report  

## weather report path 2
* weather_report
  -action_weather_report
* speak_up
  -utter_speakup

# bot memory 
* speak_up
  -utter_speakup