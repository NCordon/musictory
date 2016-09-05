# musictory
Music Directory, information system implemented for the UGR subject 'Diseño y Desarrollo de Sistemas.

## License
Licensed in Apache

## Documentation
Can be compiled going to `./doc` and making either:

``pandoc -V lang=spanish memoria.md -o memoria.pdf --template default.latex -N``

or:

``make``

## Use

To run in `development` environment:

~~~
app/bin/rails server
~~~

To run in `production` environment:

~~~
RAILS_ENV=production bundle exec rake assets:precompile
./bin/rails server -e production 
~~~

Site can be visited in a browser in [localhost:3000](http://localhost:3000)
