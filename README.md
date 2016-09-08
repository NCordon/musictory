# musictory
Music Directory, information system implemented for the UGR subject 'Diseño y Desarrollo de Sistemas.

## License
Licensed in Apache

## Documentation
Can be compiled going to `./doc` and making either:

~~~
  pandoc -V lang=spanish memoria.md -o memoria.pdf --template default.latex -N
~~~

or:

~~~
  make
~~~

## Use

First we must do:
~~~
  bundle install
  app/bin/rails db:migrate
~~~

### Development env
To run in `development` environment:

~~~
  app/bin/rails server
~~~

### Test env
To run in `test` and `development` environment,a  suitable configuration for own database will be needed in `config/database.yml`and the pertinent user and password will need to be added to `config/application.yml`:

~~~
  DB_USER: user
  DB_PASS: pass
~~~

To serve the application in `test` environment:

~~~
  app/bin/rails server -e test
~~~

### Production env
To run in `production` environment, first the `key_secret` needs to be generated:

~~~
echo -n "production:\n  SECRET_KEY_BASE: `RAILS_ENV=production rake secret`" >> ./config/application.yml
RAILS_ENV=production bundle exec rake assets:precompile
~~~

To serve the application in `production` environment:

~~~
  app/bin/rails server -e production
~~~


Site can be visited in a browser in [localhost:3000](http://localhost:3000)
