# Parcel Terminal Dashboard with Ruby on Rails + Omniva API + cron job

An app with advanced filtering to view the list/details of Omnival parcel terminals and download the filtered list in Excel format. The Omniva parcel terminal data is stored in a database, which is refreshed each night via cron job (Whatever gem)

## Install

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

## Set cron task

```bash
$ whenever --update-crontab

# for development
$ whenever --update-crontab --set environment='development'
```

Task logs are stored in `/log/production.log` for production and `/log/development.log` for development respectively.
