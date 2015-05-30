require 'sinatra'
require 'data_mapper'

# ---------------------------------------------------------
# Database Stuff
# http://datamapper.org/docs/properties.html
#

if ENV['RACK_ENV'] == 'development'
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")
else
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
end

class Person
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :age, Integer
  property :created_at, DateTime
end

DataMapper.finalize

Person.auto_upgrade!
# ---------------------------------------------------------


# ---------------------------------------------------------
# Routes
#
get '/' do
"This is the index page. I can put <b>HTML</b> here!"

end



