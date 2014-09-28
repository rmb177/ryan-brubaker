
import os
import jinja2
import webapp2

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class Pong(webapp2.RequestHandler):
   """
   Display the Pong game
   """
   def get(self):
      template = JINJA_ENV.get_template('pong.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/fun/collision-detection/pong/?', Pong)])
