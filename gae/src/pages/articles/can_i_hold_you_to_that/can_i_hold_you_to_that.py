
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class CanIHoldYouToThat(webapp2.RequestHandler):
   """
   Displays article Can I Hold You to That?
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/can_i_hold_you_to_that/can_i_hold_you_to_that.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/can_i_hold_you_to_that', CanIHoldYouToThat)])
