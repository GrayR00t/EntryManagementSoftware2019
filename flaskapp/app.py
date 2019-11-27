from flask import Flask, render_template, flash, redirect, url_for, session, logging,request, session
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators,DateTimeField,IntegerField
from twilio.rest import Client
from functools import wraps
import smtplib


mysql = MySQL()

app = Flask(__name__)

# Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'myflaskapp'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
# init MYSQL
mysql = MySQL(app)

#function to send mail to host and guest
def sendmail(message,sender,receiver,password):
    s = smtplib.SMTP('smtp.gmail.com', 587)
    s.starttls()
    s.login(sender, password)
    #s.login(os.environ.get("id"), os.environ.get("pass"))
    s.sendmail(sender, receiver, message)
    s.quit()
    #print("Sent")

#function to send message to host and guest
def sendmsg(message,receiver):
    account_sid = 'ACf7#######################'
    auth_token = '##########################'
    client = Client(account_sid, auth_token)

    message = client.messages.create(
                              body=message,
                              from_='+12017345784',
                              to=receiver
                          ) 

@app.route('/')

def home():
	return render_template('home.html')


#Register form class

class RegisterForm(Form):
    guestname  = StringField('Guest Name', [validators.Length(min=1, max=100)])
    guestphone = StringField('Guest Contact',[validators.Length(10)])
    guestemail = StringField('Guest Email', [validators.Length(min=6, max=100)])
    hostname   = StringField('Host Name', [validators.Length(min=1, max=100)])
    hostphone  = StringField('Host Contact', [validators.Length(10)])
    hostemail  = StringField('Host Email', [validators.Length(min=6, max=100)])
    checkin    = StringField('Check In Time', [validators.Length(8)])
    checkout    = StringField('Check Out Time', [validators.Length(8)])



@app.route('/register', methods=['GET', 'POST'])


def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        #get form fields
        guestname  = form.guestname.data
        guestphone = form.guestphone.data
        guestemail = form.guestemail.data
        hostname   = form.hostname.data
        hostphone  = form.hostphone.data
        hostemail  = form.hostemail.data

        # check to make sure time in particular format
        if(form.checkin.data[2]==':' and (form.checkin.data[6:]=='AM' or form.checkin.data[6:]=='PM')):
            checkin = form.checkin.data
        else:
            flash('Time should be in HH:MM_AM')
        if(form.checkout.data[2]==':' and (form.checkout.data[6:]=='AM' or form.checkout.data[6:]=='PM')):
            checkout = form.checkout.data
        else:
            flash('Time should be in HH:MM_AM')           

        session['guestphone'] = guestphone
        session['guestemail']=guestemail
        session['guestname']= guestname
        session['hostname'] = hostname
        session['checkin']  = checkin
        visitedaddress = 'ABCD'

        #visitor details to be sent to host
        msg_host = 'Visitor Details' + '\n'+'Name - '+guestname+'\n' + 'Email - ' +guestemail + '\n' + 'Phone - ' + guestphone + '\n' + 'Checkin Time - ' + checkin + '\n' + 'Checkout Time - ' + checkout 
        db = mysql.connection.cursor()

        # Execute query to save data to database
        db.execute("INSERT INTO visitor2(guestname,guestemail,guestphone,hostname,hostemail,hostphone,checkin,checkout,visitedaddress) VALUES(%s, %s, %s, %s, %s, %s,%s, %s, %s)",(guestname,guestemail,guestphone,hostname,hostemail,hostphone,checkin,checkout,visitedaddress))

        # Commit to DB
        mysql.connection.commit()

        # Close connection
        db.close()
        #sending message to host
        sendmsg(msg_host, '+91'+ hostphone)

        #sending mail to host
        sendmail(msg_host, 'neerajtesting1234@gmail.com', hostemail, '################')

        flash('Registration Succesful! Have a Good Day')

        return redirect(url_for('home'))
    return render_template('register.html', form=form)


@app.route('/about')

def about():
    return render_template('about.html')



@app.route('/checkout' , methods = ['GET', 'POST'])
def checkout():
    if request.method == 'POST':
        # Get Form Fields
        guestphone = request.form['guestphone']
        guestemail = request.form['guestemail']
        checkout1 = request.form['checkout']
        visitedaddress = 'ABCD'
        if(checkout1[2]==':' and (checkout1[6:]=='AM' or checkout1[6:]=='PM')):
            checkout = checkout1
        else:
            flash('Time should be in this format HH:MM_AM')
            return render_template('login.html')
        # Create cursor
        cur = mysql.connection.cursor()

        # Get user by username
        result = cur.execute("SELECT * FROM visitor2 WHERE guestphone = %s", [guestphone])
        result1 = cur.execute("SELECT * FROM visitor2 WHERE guestemail = %s", [guestemail])

        if result > 0 and result1 > 0:
            # Execute to query to update checkout time 
            cur.execute("UPDATE visitor2 SET checkout = checkout WHERE guestemail = guestemail")

            # message body to be sent to guest
            session['msg_guest'] = 'Meeting Details' + '\n' + 'Name - '+ session['guestname']  +'\n' + 'Email - ' + session['guestemail'] + '\n' + 'Phone - ' + session['guestphone'] + '\n' + 'Check Time - ' + session['checkin'] +'\n'+'checkout Time - ' + checkout +'\n' + 'Host Name - ' + session['hostname'] +'\n' + 'Address Visited - ' + visitedaddress 

            #sending message to guest          
            sendmsg(session['msg_guest'], '+91'+ session['guestphone'])

            #sending mail to guest
            sendmail(session['msg_guest'], 'neerajtesting1234@gmail.com' ,session['guestemail'], '############' )

            flash('Succesfully Checked Out')
            cur.close()
            return render_template('home.html')
        else:
            error = 'Username not found'
            return render_template('login.html', error=error)

    return render_template('login.html')












if __name__ == '__main__':
    app.secret_key='secret123'
    app.run(debug=True)
