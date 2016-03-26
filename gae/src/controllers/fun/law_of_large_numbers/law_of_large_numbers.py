import os
import jinja2
import webapp2

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)

class LawOfLargeNumbers(webapp2.RequestHandler):
   def get(self):   
      template = JINJA_ENV.get_template('law_of_large_numbers.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/fun/law-of-large-numbers/?', LawOfLargeNumbers)])
