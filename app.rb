require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "SQLite3:my_database.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end


#вызывается каждый раз при перезагрузке сайт/страницы
before do
#инициализация БД
@barbers = Barber.all
#Barber.order 'created_at desc'
end

get '/' do
	erb :index
end

get '/visit' do
@barberss = Barber.order(:name)
erb :visit
end

post '/visit' do
	@user = Client.new params[:client]
	@user.save
erb 'thank you your '
end
	