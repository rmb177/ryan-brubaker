
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class AnnotatedTuringWithSimulator(webapp2.RequestHandler):
   """
   Displays article Annotated Turing (with Simulator)
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/annotated_turing_with_simulator/annotated_turing_with_simulator.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/annotated_turing_with_simulator', AnnotatedTuringWithSimulator)])
