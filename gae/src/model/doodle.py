#!/usr/bin/env python
# encoding: utf-8

"""
Module for Doodle class
"""

from google.appengine.ext import ndb

class Doodle(ndb.Model):
    """
    Doodle model to represent a doodle on my site
    """
    id = ndb.IntegerProperty()
    title = ndb.StringProperty()
    intro = ndb.StringProperty()
    imgUrl = ndb.StringProperty()
    doodleUrl = ndb.StringProperty()