class CreateBarbers < ActiveRecord::Migration[6.0]
  def change

  	create_table :barbers do |t|
      #будут созданы следующие столбы с типом text
  		t.text :name
  		t.text :phone
      # дата создания сущностей и обновления
		t.timestamps  		
	end

	Barber.create  name: 'Кудрявый'
	Barber.create  name: 'Олдфаг'
	Barber.create  name: 'Модный'

  end
end
