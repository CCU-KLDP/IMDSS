# IMDSS
University project

## I. PREREQUIRE

### 1. install virtualenv
``` pip install virtualenv ```
### 2. create new virtualenv .venv
``` python3 -m venv .venv ```
### 3. activate virtualenv 
- #### Max/Linux

    ``` source .venv/bin/activate ```
- #### Windows

    ``` .venv\Scripts\activate ```

### 4. install django2.0.2 + mysqlclient + flake8

- install django2.0.2

    ``` pip install django==2.0.2```

- install mysqlclient

    ``` pip install mysqlclient ```

- install flake8

    ``` pip install flake8 ```

- install mysql-connector

    ``` pip install mysql-connector ```｀

## II. Setting Database 
### 1. move a config.py into IMDSS/IMDSS/

### 2. make migrations
``` (.venv)IMDSS-Project/IMDSS> python3 manage.py makemigrations```

### 3. migrate
``` (.venv)IMDSS-Project/IMDSS> python3 manage.py migrate```

### 4. test db connection
``` (.venv)IMDSS-Project/IMDSS> python3 test_db.py ```

Connect successfully! You will get like this as below
![](https://i.imgur.com/YNP8cJz.png)
