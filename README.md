# Instructions:

## Install Vagrant: https://www.vagrantup.com/docs/installation/


## Install the Salt Vagrant plugin from the commandline: 
~~~
$ vagrant plugin install vagrant-salt
~~~


## To provision the "Database" , clone this repo and run: 
~~~
$ cd onefootball-devops/database ; vagrant up
~~~


## To provision the "Webapp" , clone this repo and run: 
~~~
$ cd onefootball-devops/webapp ; vagrant up 
~~~




Database user and password is "webapp" : mysql -uwebapp -pwebapp -h127.0.0.1
