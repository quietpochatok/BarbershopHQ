require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "SQLite3:my_database.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

# def init_db
# @db= SQLite3::Database.new 'db/leprosorium.db'
# @db.results_as_hash = true #резyльтат в виде хэша
# end

# #вызывается каждый раз при перезагрузке сайт/страницы
# before do
# #инициализация БД
# init_db
# end


get '/' do
	@barbers = Barber.all
				#Barber.order 'created_at desc'
	erb :index
end

get '/visit' do
	# @barberss =  db.execute 'select * from Barbers order by nameBarber'
erb :visit
end

post '/visit' do
		db = get_db 
@barberss =  db.execute 'select * from Barbers order by nameBarber'
		@userName = params[:userName]
		@userNumber = params[:userNumber]
		@userDateTime = params[:userDateTime]
		@barber = params[:barber]
		@colorpicker = params[:colorpicker]
	
		hhErrorForms = {userName:'Не введено имя!',
						userNumber: 'Не введено номер!',
						userDateTime: 'Не введена дата и время'}

	@error = hhErrorForms.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ''
		return erb :visit
	end

		db = get_db
		db.execute 'insert into
			Users (
					userName,
					userNumber,
					userDateTime,
					barber,
					colorpicker
					) VALUES (?, ?, ?, ?, ?)', [@userName, @userNumber, @userDateTime, @barber, @colorpicker]


	 @title = "Спасибо,что записались к нам, #{@userName}!"
	 #@messageUser = "Dear #{@userName}, your phonenumber:#{@userNumber} and your date and time #{@userDateTime}, your color #{@colorpicker}. We will be waiting."
	
	 erb :message	

end
