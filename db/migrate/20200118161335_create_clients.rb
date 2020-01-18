class CreateClients < ActiveRecord::Migration[6.0]
  def change
  	create_table :client do |t|
      #будут созданы следующие столбы с типом text
  		t.text :name
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color
      # дата создания сущностей и обновления
		  t.timestamps  		
  	end
  end
end
