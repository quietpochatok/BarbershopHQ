require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "SQLite3:my_database.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 2}
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
#данное выражение и метод позволяют заменить строчки 40, 35 и 34
#Barber.order 'created_at desc'
end

get '/' do
	erb :barbers_list
end

get '/visit' do
@user = Client.new
# # @barbers = Barber.all
# @barberss = Barber.order(:name)
erb :visit
end

post '/visit' do
	# @barberss = Barber.order(:name)
	@user = Client.new params[:client]
	if @user.save
		erb 'Thank you choise'
	else
		@error = @user.errors.full_messages.first
		erb :visit
	end

end

get '/barbers' do
erb :barbers_list	
end

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber_page
end




