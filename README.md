# Parcel Terminal Dashboard with Ruby on Rails + Omniva API + Whatever gem

An app with advanced filtering to view the list/details of Omnival parcel terminals and download the filtered list in Excel format. The database is refreshed each night via cron job (Whatever gem)

# Install

Rails 6.1.5

```bash

git clone git@github.com:NorthOC/rails-task.git
cd rails-task
bundle install
rake db:create
rake db:migrate
rake db:seed
rails assets:precompile

```

Padariau su Whenever gem, kuris padeda valdyti cron jobs su `config/schedule.rb` failu

Norint paleisti:

```bash
$ whenever --update-crontab

# for development
$ whenever --update-crontab --set environment='development'
```

Cron task logs are stored in `/log/production.log` for production and `/log/development.log` for development respectively.
