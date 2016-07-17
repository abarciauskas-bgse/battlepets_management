[Install Dependencies Source](http://railsapps.github.io/installrubyonrails-mac.html)


```bash
\curl -L https://get.rvm.io | bash -s stable
```

# PostgreSQL

Chose PostgreSQL because it is the most advanced DBMS. [source](https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems). No need for advanced data types now, but this means we are not limited to them.

[How To Setup Ruby on Rails with Postgres](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)

```psql
create role battlepets_management with createdb login password 'password1';
```

