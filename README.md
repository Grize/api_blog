* Описание

Проект создан в рамках выполнения тестового задания. 

* Первый запуск

```
gem install bundler
bundle install
cp config/database.yml.example config/database.yml
```

Далее необходимо сконфигурировать файлы config/database.yml и config/secrets.yml по аналогии с приведенным образцом.

Затем подготавливаем базу данных:

```
rails db:create
rails db:migrate
rails db:seed
```

Заполнение базы данных может потребовать значительного времени!

Запуск сервера 
```
rails s
```
