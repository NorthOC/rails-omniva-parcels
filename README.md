# Startup

```bash
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
```
## 1. Kiekvieną naktį sinchronizuotų paštomatus iš: https://www.omniva.lt/locations.json;

Padariau su Whenever gem, kuris padeda valdyti cron jobs su `config/schedule.rb` failu

Norint paleisti:

```bash
$ whenever --update-crontab

# arba development aplinkai
$ whenever --update-crontab --set environment='development'
```

patikrinti ar suveikė komanda:

```bash
$ crontab -l

```

Logs informacija: `/log/production.log` arba `/log/development.log` priklausomai nuo aplinkos.