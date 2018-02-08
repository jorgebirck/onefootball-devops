# Some notes first:

- I was not worried about security in this challenge, so I used weak passwords and no whitelist for IPs ;

- I had to increase Vagrant VM memory for MySQL-5.6 ;


Improvements that can be done:

- The GoLang package (.deb) was installed throught a static URL, GoWebApp doesn't run with the official Ubuntu 14.04 package. Would be better to use a repository and keep it up to date (secure) ;

- Find a better way to set env variables in Saltstack ;

- Find a better way to start (some)services in Saltstack ;

- Use more local files in Saltstack instead of download with wget (to avoid 404) ;

- Add .vagrant dir to gitignore ;


# Instructions:

## Install Vagrant: 
https://www.vagrantup.com/docs/installation/


## Install the Salt Vagrant plugin:  
~~~
$ vagrant plugin install vagrant-salt
~~~


## Provision the Database: 
Clone this repo and run: 
~~~
$ cd onefootball-devops/database ; vagrant up
~~~


## Provision the Webapp:
Run: (you should have database VM running first)
~~~
$ cd ../webapp/ ; vagrant up 
~~~


## Provision the Monitor:
Run: 
~~~
$ cd ../monitor/ ; vagrant up
~~~


## URLs
Database: mysql -uwebapp -pwebapp -h127.0.0.1 gowebapp

GoWebApp: http://localhost:8080

Monitor / Uchiwa: http://localhost:3000


## IPs - hosts 
192.168.51.1 - database

192.168.51.2 - webapp

192.168.51.3 - monitor
