
import os
import jinja2
import webapp2

import src.pages.base as base


JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)

class SumOfNaturalNumbers(webapp2.RequestHandler):
    """
    Displays the animated demo for the formula for the sum of natural numbers
    """
    def get(self):   
        template = JINJA_ENV.get_template('doodles/sum_of_natural_numbers/sum_of_natural_numbers.html')
        self.response.write(template.render())
    #
#

app = webapp2.WSGIApplication([('/doodles/sum_of_natural_numbers/?', SumOfNaturalNumbers)])
