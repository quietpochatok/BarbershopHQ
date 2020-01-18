
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :base, "sqlite3:my_database.db"

class Client < ActiveRecord::Base
end


get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end