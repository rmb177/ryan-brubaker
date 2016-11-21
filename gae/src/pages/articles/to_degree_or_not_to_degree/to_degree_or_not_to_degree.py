
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class ToDegreeOrNotToDegree(webapp2.RequestHandler):
   """
   Displays article To Degree or not to Degree?
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/to_degree_or_not_to_degree/to_degree_or_not_to_degree.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/to_degree_or_not_to_degree', ToDegreeOrNotToDegree)])
