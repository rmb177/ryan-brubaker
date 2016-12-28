
import os
import jinja2
import webapp2

import src.pages.base as base


JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)

class TuringMachineSimulator(webapp2.RequestHandler):
   """
   Displays the Turing Machine simulator demo
   """
   def get(self):   
       template = JINJA_ENV.get_template('doodles/turing_machine_simulator/turing_machine_simulator.html')
       self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/doodles/turing_machine_simulator/?', TuringMachineSimulator)])
