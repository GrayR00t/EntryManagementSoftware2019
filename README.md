# Entry Management Software

This application is built on the Python Flask framework to capture the visitor details and save in databases with timestamp. Twillio is used to trigger sms and smtplib used to  mail user and host.

## Installation

Use the requirements.txt to install dependencies.

```bash
pip install -r requirements.txt
```

## Configuration

### Database server setup 

Create table in your database name visitor
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

```python
import foobar

foobar.pluralize('word') # returns 'words'
foobar.pluralize('goose') # returns 'geese'
foobar.singularize('phenomena') # returns 'phenomenon'
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)