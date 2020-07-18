from flask import Flask, render_template, request, session,redirect,url_for
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail
import os
from werkzeug.utils import secure_filename
import math
with open('config.json', 'r') as f:
    params = json.load(f)["params"]

local_server = params["local_server"]
app = Flask(__name__)
app.secret_key = 'mywebpage'
app.config['UPLOAD_FOLDER']=params["upload_location"]
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['email'],
    MAIL_PASSWORD=params['pass']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(12), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    sub_title = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file=db.Column(db.String(20),nullable=False)


class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()

    page = request.args.get("page")
    last = math.ceil(len(posts)/params["no_of_posts"])
    if(page==None):
        page=1
    page=int(page)
    total=int(params["no_of_posts"])
    posts = posts[(page-1)*total:(page-1)*total + total]
    if(page == 1 ):
        prev = "#"
        next = "/?page="+str(page+1)
    elif(page==last):
        prev = "/?page=" + str(page - 1)
        next = "#"

    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)


@app.route("/about")
def about():
    return render_template('about.html',params=params)


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user']==params['admin_user']:
        posts=Posts.query.all()
        return render_template('dashboard.html', params=params,posts=posts)
    if request.method=="POST":
        uname=request.form.get("uname")
        password=request.form.get("pass")
        if(uname==params['admin_user'] and password==params['admin_pass']):
            posts = Posts.query.all()
            session['user']=uname
            return render_template('dashboard.html', params=params, posts=posts)
    return render_template('login.html',params=params)


@app.route("/post")
def post():
    posts= Posts.query.filter_by().all()
    return render_template('post.html',params=params,posts=posts)


@app.route("/delete/<string:sno>", methods=['GET','POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post= Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)


@app.route("/edit/<string:sno>", methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method=="POST":
            title=request.form.get("title")
            sub_title = request.form.get("sub_title")
            slug = request.form.get("slug")
            content = request.form.get("content")
            image = request.form.get("image")
            date=datetime.now()
            if sno=="0":
                posts=Posts(title=title,slug=slug,content=content,sub_title=sub_title,img_file=image,date=date)
                db.session.add(posts)
                db.session.commit()
                return redirect(url_for("dashboard"))
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = title
                post.slug = slug
                post.content = content
                post.sub_title = sub_title
                post.img_file = image
                post.date = date
                db.session.commit()
                return redirect(url_for('dashboard'))
        post = Posts.query.filter_by(sno=sno).first()
        return render_template("edit.html", params=params , post=post,sno=sno)


@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method=="POST":
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "Uploaded Successfully"


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")



@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if(request.method == 'POST'):
        name = request.form.get("name")
        email = request.form.get("email")
        phone = request.form.get("phone")
        message = request.form.get("message")
        entry = Contact(name=name, phone_num=phone, mes=message, date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients=[params['email']],
                          body=message + "\n" + phone
                          )
        return redirect(url_for('home'))
    return render_template('contact.html', params=params)


app.run(debug=True)









