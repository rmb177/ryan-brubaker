
import os
import jinja2
import webapp2

import src.pages.base as base


JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)

class BallsInBox(webapp2.RequestHandler):
   """
   Displays the Balls in a Box demo
   """
   def get(self):   
       template = JINJA_ENV.get_template('doodles/balls_in_box/balls_in_box.html')
       self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/doodles/balls_in_box/?', BallsInBox)])
