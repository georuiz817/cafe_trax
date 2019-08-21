class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name 
      t.string :location
      t.string :wifi_avaliable 
      t.integer :user_id
    end
  end
end