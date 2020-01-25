require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "SQLite3:my_database.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: {minimum:3}
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
	validates :barber, presence: true
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
@user = Client.new
# @barberss = Barber.all
@barbers = Barber.order(:name)
erb :visit
end

post '/visit' do
	@barberss = Barber.order(:name)
	@user = Client.new params[:client]
	if @user.save
		erb 'Thank you choise'
	else
		@error = @user.errors.full_messages.first
		erb :visit
	end

end
	