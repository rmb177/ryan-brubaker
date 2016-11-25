
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class TurnYourMacIntoAThermometerWithArduino(webapp2.RequestHandler):
   """
   Displays article Turn Your Mac into a Thermometer with Arduino
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/turn_your_mac_into_a_thermometer_with_arduino/turn_your_mac_into_a_thermometer_with_arduino.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/turn_your_mac_into_a_thermometer_with_arduino', TurnYourMacIntoAThermometerWithArduino)])