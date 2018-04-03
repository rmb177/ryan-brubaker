#!/usr/bin/env python
# encoding: utf-8

"""
Module for Article class
"""

from google.appengine.ext import ndb

class Article(ndb.Model):
    """
    Article model to represent an article on my site
    """
    id = ndb.IntegerProperty()
    title = ndb.StringProperty()
    intro = ndb.StringProperty()
    imgUrl = ndb.StringProperty()
    articleUrl = ndb.StringProperty()