
import os
import jinja2
import webapp2

import src.pages.base as base
import src.model.article as article


JINJA_ENV = jinja2.Environment(
 loader=jinja2.FileSystemLoader(base.BASE_PATH),
 extensions=['jinja2.ext.autoescape'],
 autoescape=True)
 
class Articles(webapp2.RequestHandler):
    """
    Displays main article page
    """
    def get(self):        
        articles = article.Article.query().order(-article.Article.id).fetch()
        template = JINJA_ENV.get_template('articles/articles.html')
        self.response.write(template.render(articles=articles))
    #
#

app = webapp2.WSGIApplication([('/articles/\d', Articles)])
