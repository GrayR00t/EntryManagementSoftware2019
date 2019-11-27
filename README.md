# Entry Management Software

This application is built on the Python Flask framework to capture the visitor details and save in databases with timestamp. Twillio is used to trigger sms and smtplib used to  mail user and host.

## Installation

Navigate to flaskapp use the requirements.txt to install dependencies.

```bash
pip install -r requirements.txt
```

## Configuration

### Database server setup 

Create table in your database name visitor2
```bash
> CREATE TABLE visitor2(id INT(11) AUTO_INCREMENT PRIMARY KEY, guestname VARCHAR(100), guestemail VARCHAR(100),guestphone VARCHAR(10), hostname VARCHAR(100), hostemail VARCHAR(100) , hostphone VARCHAR(10), checkin VARCHAR(100), checkout VARCHAR(100), visitedaddress VARCHAR(300) , register_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
```
Configure and initiliase MYSQL
```python
from flask_mysqldb import MySQL
# Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'myflaskapp'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
# init MYSQL
mysql = MySQL(app)
# Create cursor
db = mysql.connection.cursor()
```
### Messeging service setup
Regestred on Twilio site and get number, account_sid and auth_token to use the messeging service.

```python
#function to send message to host and guest
def sendmsg(message,receiver):
    account_sid = 'AC###########################'
    auth_token = '##############################'
    client = Client(account_sid, auth_token)

    message = client.messages.create(
                              body=message,
                              from_='+12017345784',
                              to=receiver
                          ) 
```
### Mail service setup

To set up a Gmail address for testing your code, do the following:
- Create a new Google account.
- Turn Allow less secure apps to ON. Be aware that this makes it easier for others to gain access to your account.

```python
# function to send email to host and guest
def sendmail(message,sender,receiver,password):
    s = smtplib.SMTP('smtp.gmail.com', 587)
    s.starttls()
    s.login(sender, password)
    #s.login(os.environ.get("id"), os.environ.get("pass"))
    s.sendmail(sender, receiver, message)
    s.quit()
```

## Demo and Visuals
- Home page of app
![Home Page](/screenshots/HomePage.png)

- Registration page of app
![Registration Page](/screenshots/RegistrationPage.png)

- Checkout page of app
![Checkout Page](/screenshots/CheckoutPage.png)
- For live demonstration of work flow please paste the link in browser "https://drive.google.com/file/d/1R3cBxbJZEPBDzM2EvAt8E5OMMDTYSJQj/view?usp=sharing"


## Credits
- Google Search for finding needful blog and resources for reference.
- smtplib and twilio for sending mail and messenging.
- [Asciinema](https://asciinema.org/docs/getting-started) used in making working visual and [make a README](https://www.makeareadme.com/) for such nice explanation in making README file.

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Project Status
- Due to some issues with my kali virtual machine, I was not able to work in a separate virtual environment. This results in all pip packages of mine machine is present in requirements.txt please ignore others.
- Checkout function can be modified more like the guest should get suggested name and number so he can choose instead of submitting the form. It can't be delivered due to the end semester examination.