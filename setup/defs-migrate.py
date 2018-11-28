#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Create a sqlite database from separate json, and html file

import logging
from logging.handlers import RotatingFileHandler
import os
import sys
#import sqlite3
import MySQLdb
import re
import fnmatch
import json

MENU_BASE = "/library/www/html/iiab-menu/menu-files/menu-defs"
os.chdir(MENU_BASE)

columns = ['menu_item_name','description','title','extra_html',
           'lang','zim_name','logo_url','intended_use','moddir',
           'start_url','apk_file','apk_file_size']
# ##########  scan for variable names #############
keys=[]
for filename in os.listdir('.'):
   if fnmatch.fnmatch(filename, '*.json'):
      with open(filename) as json_file:  
          data = json.load(json_file)
          for p in data.keys():
             # replace any blanks with underbar
             p = p.replace(" ","_")
             p = p.replace("-","_")
             if not p in keys:
                keys.append(p)

# ########## database operations ##############
conn = MySQLdb.connect(host="localhost",
                     charset="utf8",
                     user="menus_user",
                     passwd="g0adm1n",
                     db="menus_db")
if not conn:
       print("failed to open mysql database")
       sys.exit(1)
c = conn.cursor()
c.execute('truncate menus')
#c.execute('flush tables')
# ########## Transfer the values  ##############

keys=[]
for filename in os.listdir('.'):
   if fnmatch.fnmatch(filename, '*.json'):
      nameval = filename[:-5]
      # skip over this file if it exists in database
      rows = c.execute("select name from menus where name = %s",(nameval,))
      if not rows:
         # make sure record exists
         sql = "INSERT IGNORE INTO menus SET name=%s"
         #print(sql)
         c.execute(sql,(nameval,)) 
         with open(filename) as json_file:  
             reads = json_file.read()
             data = json.loads(reads)
             for col in columns:
                if col in data.keys():
                   updstr = data[col].replace("'","''")
                   sql = "UPDATE menus set " + col + " = %s where name = %s"
                   try:
                     c.execute(sql,(updstr,nameval,))
                   except MySQLdb.Error as e:
                     print str(e)
                     print sql
                          
             instr = ''
             lines = reads.split('\n')
             for line in lines:
                line = line.rstrip('\n')
                line = line.rstrip('\r')
                line = line.rstrip('\n')
                line = line.lstrip(' ')
                instr += line
             updstr = instr.replace("'","''")
             #updstr = instr.replace('\\"','\\\\"')
             sql = "UPDATE menus set js = %s where name = %s"
             try:
               c.execute(sql,(updstr,nameval,))
             except MySQLdb.Error as e:
               print str(e)
               print sql
   if fnmatch.fnmatch(filename, '*.html'):
      nameval = filename[:-5]
      if True:
         with open(filename) as html_file:  
             reads = html_file.read()
             updstr = reads.replace("'","''")
             sql = "UPDATE menus set extra_html = %s where name = %s"
             try:
               c.execute(sql,(updstr,nameval))
             except MySQLdb.Error as e:
               print str(e)
               print sql
                          
   conn.commit()
conn.close()
