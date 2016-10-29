
import os
import jinja2
import webapp2

JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)

class TuringMachine(webapp2.RequestHandler):
   """
   Displays the Turing Machine simulator demo
   """
   def get(self):   
      template = JINJA_ENV.get_template('turing_machine.html')
      self.response.write(template.render())
   #
#

app = webapp2.WSGIApplication([('/fun/turing-machine/?', TuringMachine)])
