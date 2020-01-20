require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "SQLite3:my_database.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end



# def is_barber_exists? db, nameBarber
# 	db.execute('select * from Barbers where name=?', [name:]).size > 0
# end

# def seed_db db, barbers #наполняется из №47, далее итерация; and #саll №13
# 	barbers.each do |barber|
# 		#проверка барбера сущ-ет или нет в таблице, если нет
# 		if !is_barber_exists? db, barber
# 			#то добавится в таблицу с помощью ниже команды
# 			db.execute 'insert into Barbers (nameBarber) VALUES (?)', [barber]
# 			end
# 		end

# end
#вызывается каждый раз при перезагрузке сайт/страницы
# before do
# #инициализация БД
# get_dbss

# end

get '/' do
	@barbers = Barber.all
			#Barber.order 'created_at desc'
	erb :index
end
get '/visit' do
@barberss = Barber.order(:name)
erb :visit
end

post '/visit' do
@barberss = Barber.order(:name)
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


end
	