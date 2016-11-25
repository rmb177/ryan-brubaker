
import os
import jinja2
import webapp2

import src.pages.base as base

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class PrototypalVsFunctionalInheritanceInJavaScript(webapp2.RequestHandler):
   """
   Displays article Prototypal Vs. Functional Inheritance in JavaScript
   """
   def get(self):
      template = JINJA_ENV.get_template('articles/prototypal_vs_functional_inheritance_in_javascript/prototypal_vs_functional_inheritance_in_javascript.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/articles/prototypal_vs_functional_inheritance_in_javascript', PrototypalVsFunctionalInheritanceInJavaScript)])
