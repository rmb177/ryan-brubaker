
import os
import jinja2
import webapp2

import src.pages.base as base


JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class Talks(webapp2.RequestHandler):
    """
    Displays main talks page
    """
    def get(self):        
        template = JINJA_ENV.get_template('talks/talks.html')
        self.response.write(template.render())
    #
#

app = webapp2.WSGIApplication([('/talks/?', Talks)])
