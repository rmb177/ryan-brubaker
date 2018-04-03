
import os
import jinja2
import webapp2

import src.pages.base as base
import src.model.doodle as doodle


JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class Doodles(webapp2.RequestHandler):
    """
    Displays main doodle page
    """
    def get(self):
        doodles = doodle.Doodle.query().order(-doodle.Doodle.id).fetch()
        template = JINJA_ENV.get_template('doodles/doodles.html')
        self.response.write(template.render(doodles=doodles))
    #
#

app = webapp2.WSGIApplication([('/doodles/\d', Doodles)])
