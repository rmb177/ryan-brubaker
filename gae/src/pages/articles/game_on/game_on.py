
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class GameOn(webapp2.RequestHandler):
   """
   Displays article Game On
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/game_on/game_on.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/game_on', GameOn)])
