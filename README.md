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
Clone this repo and run: (you should have database VM running first)
~~~
$ cd onefootball-devops/webapp ; vagrant up 
~~~




Database user and password is "webapp" : mysql -uwebapp -pwebapp -h127.0.0.1
