# Eclisse Music School Accounts Back End Service

Manage Eclisse Music School Accounts:
  - Create Account
  - Delete Account
  - Display Account
  - Display Accounts
  - Update Account

## Installation

Start by getting and setting up the global configuration file.

### Local

```bash
$ bundle config set clean 'true'
$ bundle install --jobs=10
$ bundle exec foreman start
```

### Using Docker & Docker-compose

#### Docker
```bash
$ docker build --no-cache -t accounts .
$ docker run -p 3000:3000 --name accounts --rm accounts
```

#### Docker-compose

```bash
$ docker-compose build
$ docker-compose run --name accounts -p 3000:3000 --rm accounts bundle install
$ docker-compose up
```

or

```bash
$ docker-compose build
$ docker-compose run --name accounts -p 3000:3000 --rm accounts bundle install
$ docker-compose run --rm -p 3000:3000 accounts bundle exec shotgun -o 0.0.0.0
```

> Accounts API available on port 3000.
>
> MongoDB is available on port 7474.
>
> Redis is available on port 6379.

### Setting up the database

#### Migrate the database
`$ docker-compose run accounts bundle exec rake db:migrate`
#### Provision the data
`$ docker-compose run accounts bundle exec rake db:provision`
#### Provision a smaller subset of the data (faster option). See rake file for options
`$ docker-compose run accounts bundle exec rake db:provision_[data]`
