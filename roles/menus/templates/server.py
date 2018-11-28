#!/usr/bin/env python
import os
from flask import Flask,request
from flask_mysqldb import MySQL


application = Flask(__name__)
# Config MySQL
application.config['MYSQL_HOST'] = 'localhost'
application.config['MYSQL_USER'] = 'menus_user'
application.config['MYSQL_PASSWORD'] = 'g0adm1n'
application.config['MYSQL_DB'] = 'menus_db'
application.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(application)


@application.route('/')
def one():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT name,title,id,seq FROM menus limit 5''')
    rv = cur.fetchone()
    return str(rv)

@application.route('/menuitemlist')
def users():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT name,title,id,seq FROM menus''')
    #cur.execute('''SELECT name,title,id,seq FROM menus where visible=true''')
    rv = cur.fetchall()
    rtn_str = "["
    for row in rv:
       rtn_str += "{ \"name\" : \"" + row['name'] + '\" },'
    rtn_str = rtn_str[:-1]
    rtn_str += "]"
    return rtn_str

@application.route('/extra_html')
def extra_html():
    cur = mysql.connection.cursor()
    req_name=request.args.get('name')
    cur.execute("SELECT extra_html FROM menus where name='%s'"%req_name)
    row = cur.fetchone()
    if row:
       print("found htm for %s"%req_name)
       rtn_str = row['extra_html'].replace('"','\"')
    else:
       rtn_str = ""
    return rtn_str

@application.route('/js')
def json():
    cur = mysql.connection.cursor()
    req_name=request.args.get('name')
    cur.execute("SELECT js FROM menus where name='%s'"%req_name)
    row = cur.fetchone()
    if row:
       nibble = row['js']
       nibble = nibble.replace('/','\/')
       nibble = nibble.replace('\n','\\n')
       nibble = nibble.replace('\r','\\r')
       nibble = nibble.replace('\t','\\t')
    else:
       nibble = "{}"
    return nibble

@application.route('/lang')
def lang():
    cur = mysql.connection.cursor()
    lang2=request.args.get('lang')
    cur.execute("SELECT name,title,id,seq FROM menus where lang='%s'"%lang2)
    rv = cur.fetchall()
    return str(rv)
if __name__ == "__main__":
    application.run(host='0.0.0.0',port=9458)
