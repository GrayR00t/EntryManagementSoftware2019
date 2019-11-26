from flask import Flask, render_template, flash, redirect, url_for, session, logging,request
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators,DateTimeField,IntegerField
from twilio.rest import Client





app = Flask(__name__)

# Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'myflaskapp'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
# init MYSQL
mysql = MySQL(app)



def sendmail(message,sender,receiver,password):
    s = smtplib.SMTP('smtp.gmail.com', 587)
    s.starttls()
    s.login(sender, password)
    #s.login(os.environ.get("id"), os.environ.get("pass"))
    s.sendmail(sender, receiver, message)
    s.quit()
    #print("Sent")


def sendmsg(message,receiver):
    account_sid = 'AC6aa3d548629aca76096e36218a04072f'
    auth_token = '76c6e298a83c3dee200bf5d7ec0cc125'
    client = Client(account_sid, auth_token)

    message = client.messages.create(
                              body=message,
                              from_='+14124447699',
                              to=receiver
                          ) 




@app.route('/')

def home():
	return render_template('home.html')


@app.route('/about')

def about():
	return render_template('about.html')






@app.route('/checkout')

def checkout():
	return render_template('checkout.html')


@app.route('/login')

def login():
	return render_template('login.html')

#Register form class



class RegisterForm(Form):
    guestname = StringField('Guest Name', [validators.Length(min=1, max=100)])
    guestphone = StringField('Guest Contact')
    guestemail = StringField('Guest Email', [validators.Length(min=6, max=100)])
    hostname = StringField('Host Name', [validators.Length(min=1, max=100)])
    hostphone = StringField('Host Contact')
    hostemail = StringField('Host Email', [validators.Length(min=6, max=100)])
    checkin =  StringField('Check In Time')
    checkout = StringField('Check Out Time')



@app.route('/register', methods=['GET', 'POST'])

def register():
    form = RegisterForm(request.form)
    if request.method == 'POST':
        guestname = form.guestname.data
        guestphone=form.guestphone.data
        guestemail = form.guestemail.data
        hostname = form.hostname.data
        hostphone= form.hostphone.data
        hostemail = form.hostemail.data
        checkin = form.checkin.data
        checkout = form.checkout.data
        visitedaddress = "ABCD"


        # Create cursor
        db = mysql.connection.cursor()

        # Execute query
        db.execute("INSERT INTO visitor2(guestname,guestemail,guestphone,hostname,hostemail,hostphone,checkin,checkout,visitedaddress) VALUES(%s, %s, %s, %s, %s, %s,%s, %s, %s)",(guestname,guestemail,guestphone,hostname,hostemail,hostphone,checkin,checkout,visitedaddress))

        # Commit to DB
        mysql.connection.commit()

        # Close connection
        db.close()
        sendmsg('neeraj', '+918004789080')
        flash('Registration Succesful! Have a Good Day')

        return redirect(url_for('home'))
    return render_template('register.html', form=form)















if __name__ == '__main__':
    app.secret_key='secret123'
    app.run(debug=True)
