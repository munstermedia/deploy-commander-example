## Setup example



This example repo contains a basic setup with the following:

- Vagrant file (for your local dev machine)
- Setup server with puppet
- Encrypted configs
- Configs with different examples
- Main config.dist for main configuration



## Requirements

In this example we'll use [virtualbox](https://www.virtualbox.org/) and [vagrant](https://www.vagrantup.com/).

We'll assume you have worked with then...

We only tested this system on unix like machines, like Ubuntu and MacOS.
Currently we don't support other flavors... sorry... (allthough it must work on centos too...)
So for now, this quick demo can't be run if you are using a windows machine.


```
// Clone an example
git clone https://github.com/munstermedia/deploy-commander-example.git

// Go into repo
cd deploy-commander-example

// Setup main config
mv config.json.dist config.json

// Load development server, a ubuntu trusty box with ip 192.168.56.111
vagrant up
```

## Lets go...


### Install app
We're gonna install a new app from the defined repo.
Run the command and yust leave the prompt empty... it will use the default settings:

* project : (Last it can find in the config settings)
* environment : development

```
deploy-commander go run:install-app
```

What just happened?

- This will create base folders and clone the repo into a development enviroment
- We've cloned a repo into `/home/<user>/<env>/repo`
- We've created a database
- We've installed the default install.sql from repo

> Try to enter different environments, in this example they all point to the vagrant box, but for your production it can point to different servers.

### Deploy app

Now we're gonna deploy the source code and use the master branch to do so.

```
deploy-commander go run:deploy-app
```

This wil prompt you with the same like install but it will ask for a tag.
The default tag is the latest from the list.

What just happened?

- We've updated `/home/<user>/<env>/repo`
- We've created `/home/<user>/<env>/source/<tag>` from the repo
- We've backupped the database in `/home/<user>/<env>/db_backup`
- We've created a symlink `/home/<user>/<env>/current` to `/home/<user>/<env>/source/<tag>`

### Rollback app

Now we're gonna rollback the app...

```
deploy-commander go run:rollback-app
```

What just happened?

- We've removed the old symlink `/home/<user>/<env>/current` and linked it to the new tag you've entered.
- If we answered yes to import database, we could rollback the database to another version.

- - -
