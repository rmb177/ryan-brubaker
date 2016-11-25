
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class WhitherProjectManagement(webapp2.RequestHandler):
   """
   Displays article Whither Project Management?
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/whither_project_management/whither_project_management.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/whither_project_management', WhitherProjectManagement)])
