
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class ShouldDevelopersDesign(webapp2.RequestHandler):
   """
   Displays article Should Developers Design?
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/should_developers_design/should_developers_design.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/should_developers_design', ShouldDevelopersDesign)])
