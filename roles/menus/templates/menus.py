#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Fetch Menu Data from Database

from dateutil.tz import *
import datetime
import logging
from logging.handlers import RotatingFileHandler
import os
import sys
import jinja2
import flask
import sqlite3
import re

MENUS_BASE = "/opt/iiab/menus-service"

# Get the IIAB variables
sys.path.append('/etc/iiab/')
from iiab_env import get_iiab_env
doc_root = get_iiab_env("WWWROOT")


# set up some logging -- selectable for diagnostics
# Create dummy iostream to capture stderr and stdout
class StreamToLogger(object):
    """
    Fake file-like stream object that redirects writes to a logger instance.
    """
    def __init__(self, logger, log_level=logging.INFO):
        self.logger = logger
        self.log_level = log_level
        self.linebuf = ''

    def write(self, buf):
        for line in buf.rstrip().splitlines():
            self.logger.log(self.log_level, line.rstrip())

if len(sys.argv) > 1 and sys.argv[1] == '-l':
    loggingLevel = logging.DEBUG
    try:
      os.remove('/var/log/menu-service.log')
    except:
      pass
else:
    loggingLevel = logging.ERROR

# divert stdout and stderr to logger
logging.basicConfig(filename='/var/log/apache2/portal.log',format='%(asctime)s.%(msecs)03d:%(name)s:%(message)s', datefmt='%M:%S',level=loggingLevel)
logger = logging.getLogger('/var/log/apache2/portal.log')
handler = RotatingFileHandler("/var/log/apache2/portal.log", maxBytes=100000, backupCount=2)
logger.addHandler(handler)

stdout_logger = logging.getLogger('STDOUT')
sl = StreamToLogger(stdout_logger, logging.ERROR)
sys.stdout = sl

stderr_logger = logging.getLogger('STDERR')
sl = StreamToLogger(stderr_logger, logging.ERROR)
sys.stderr = sl
PORT={{ menus_service_port }}

logger.debug("")
logger.debug('##########################################')
# what language are we speaking?
lang = os.environ['LANG'][0:2]
logger.debug('speaking: %s'%lang)

#vim: tabstop=3 expandtab shiftwidth=3 softtabstop=3 background=dark

