# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/core/actions/#custom-actions/


# This is a simple example for a custom action which utters "Hello World!"
import requests
from typing import Any, Text, Dict, List
#
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
#
#
# class ActionHelloWorld(Action):
#
#     def name(self) -> Text:
#         return "action_hello_world"
#
#     def run(self, dispatcher: CollectingDispatcher,
#             tracker: Tracker,
#             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
#
#         dispatcher.utter_message(text="Hello World!")
#
#         return []

#
class ActionHelloWorld(Action):

    def name(self) -> Text:
        return "action_hello_world"
    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        print("In server")    
        api_key='1cbab4259c9afc24789d2bf9d9cc21c8'
        loc = 'berlin'
        api_address =requests.get('http://api.openweathermap.org/data/2.5/weather?q={}&appid={}'.format(loc,api_key))
        current=api_address.json()
        country = current['sys']['country']
        city = current['name']
        condition= current['weather'][0]['description']
        temperature = current['main']['temp']
        humidity = current['main']['humidity']
        wind_spd = current['wind']['speed']
        response= """It is currently {} in {} at the moment. The temperature is {} degrees, the humidity is {}% and the wind speed is {} mph.""".format(condition,city,temperature,humidity,wind_spd)
        dispatcher.utter_message(response)
        #dispatcher.utter_message(text="Hello World from my first action python file")
        return []

class ActionSearchRestaurant(Action):
    def name(self) -> Text:
        return "action_search_restaurant"
    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        entities=tracker.latest_message['entities']
        print(entities)
        
        for e in entities:
            if e['entity'] == 'NORP':
                name = e['value'].lower()
                if name=="indian":
                    message="Indian 1,indian 2"
                if name=="chinese":
                    message="chinese 1,chinese 2"
                if name=="thai":
                    message="Indian 1,indian 2"
                if name=="japenese":
                    message="Indian 1,indian 2"
                
                
                
        print(entities)        
        dispatcher.utter_message(text=message)
        
        return []
        
class WeatherReport(Action):
    def name(self) -> Text:
        return "action_weather_report"
    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        entities=tracker.latest_message['entities']
        for e in entities:
            if e['entity']=='GPE':
                loc=e['value']
        api_key='1cbab4259c9afc24789d2bf9d9cc21c8'
        #loc = tracker.get_slot('location')
        api_address =requests.get('http://api.openweathermap.org/data/2.5/weather?q={}&appid={}'.format(loc,api_key))
        current=api_address.json()
        country = current['sys']['country']
        city = current['name']
        condition= current['weather'][0]['description']
        temperature = int(current['main']['temp']-273)
        humidity = current['main']['humidity']
        wind_spd = int(current['wind']['speed']*3.6)
        response= """It is currently {} in {} at the moment. The temperature is {} degree Celsius, the humidity is {}% and the wind speed is {}mph.""".format(condition,city,temperature,humidity,wind_spd)
        print("success")
        dispatcher.utter_message(response)
        return []
        
        
        
