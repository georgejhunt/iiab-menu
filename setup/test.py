#!/usr/bin/env python
import os
from flask import Flask,request
from flask_mysqldb import MySQL


app = Flask(__name__)
# Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'menus_user'
app.config['MYSQL_PASSWORD'] = 'g0adm1n'
app.config['MYSQL_DB'] = 'menus_db'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)


@app.route('/')
def one():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT name,title,id,seq FROM menus limit 5''')
    rv = cur.fetchone()
    return str(rv)

@app.route('/menuitemlist')
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

@app.route('/extra_html')
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

@app.route('/js')
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

@app.route('/lang')
def lang():
    cur = mysql.connection.cursor()
    lang2=request.args.get('lang')
    cur.execute("SELECT name,title,id,seq FROM menus where lang='%s'"%lang2)
    rv = cur.fetchall()
    return str(rv)
if __name__ == "__main__":
    app.run(host='0.0.0.0',port=9458)
