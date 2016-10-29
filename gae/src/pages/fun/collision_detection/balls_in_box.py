
import os
import jinja2
import webapp2

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class BallsInBox(webapp2.RequestHandler):
   """
   Displays the simple balls in a box demo
   """
   def get(self):
      template = JINJA_ENV.get_template('balls_in_box.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/fun/collision-detection/balls-in-box/?', BallsInBox)])
