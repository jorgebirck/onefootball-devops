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
