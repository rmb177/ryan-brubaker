
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class Home(webapp2.RequestHandler):
   """
   Displays the main page of my website
   """
   def get(self):
      template = JINJA_ENV.get_template('home/home.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/', Home)])
