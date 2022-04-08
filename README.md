# Startup

```bash
bundle install
rake db:create
rake db:migrate
rake db:seed
```
## 1. Kiekvieną naktį sinchronizuotų paštomatus iš: https://www.omniva.lt/locations.json;

Padariau su Whenever gem, kuris padeda valdyti cron jobs su `/schedule.rb` failu

Norint paleisti:

```bash
whenever --update-crontab

# arba development aplinkai
whenever --update-crontab --set environment='development'
```

patikrinti ar suveikė komanda:

```bash
contab -l
```

Logs informacija: `/log/cron_log.log`