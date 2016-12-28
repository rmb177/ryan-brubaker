
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class HowGoogleTestsSoftware(webapp2.RequestHandler):
   """
   Displays article Book Review: How Google Tests Software
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/how_google_tests_software/how_google_tests_software.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/how_google_tests_software', HowGoogleTestsSoftware)])
