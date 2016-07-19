# README

Battlepets Management owns battlepets and their traits. For the API see **[DESIGN.md](DESIGN.md)**.

**System Dependences:**

* RVM
```bash
\curl -L https://get.rvm.io | bash -s stable
```
* Ruby version: `ruby 2.3.1p112`

**Installation**

```
git clone https://github.com/abarciauskas-bgse/battlepets_management
cd battlepets_management
bundle install
```

**Configuration**

This app uses the dicebag gem to configure config files (those suffixed with `.dice`). Generate required files with the following commands.

```bash
rake config
```

**Database creation and initialization**

Install PostgreSQL if you don't have it already: [How To Setup Ruby on Rails with Postgres](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)

PostgreSQL was chosen because it is acknowledged to be most advanced DBMS and offers the most data type flexibility ([source](https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems)). There is no requirement for advanced data types now, but this means we are not limited to them.

```bash
$ psql
username=# create role battlepets_management with createdb login password 'password1';
username=# \d
```

Create the databases and run migrations

```
rake db:create db:migrate
```

**How to run the test suite**

```
rspec spec
```

**Services (job queues, cache servers, search engines, etc.)**

None

**Deployment instructions**

None at this time

**Run the app**

```
rails s
```

## Smoketest Battlepets Management + Battlepets Arena

1. Navigate to `/battlepets_management` execute `$ rails s`
2. Naviate to `/battlepets_arena` and run sidekiq in test mode: `bundle exec sidekiq -q default -e test`
3. Open another session in `/battlepets_arena` and execute `rake cucumber`s

# TODO

* Possibly use postgresql [json types](http://www.tutorialspoint.com/postgresql/postgresql_data_types.htm) for battlepet traits
* Fix permitted params
* Use simplecov
