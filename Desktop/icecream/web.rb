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

class Flavor
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :cost, Integer
end

DataMapper.finalize

Flavor.auto_upgrade!
# ---------------------------------------------------------


# ---------------------------------------------------------
# Routes
#
get '/flavors/create' do
erb :new

end
foreman start



