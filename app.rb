require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "SQLite3:my_database.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end


get '/' do
	@barbers = Barber.all
				#Barber.order 'created_at desc'
	erb :index
end