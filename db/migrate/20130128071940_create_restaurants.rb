class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string   :name
      t.float   :rate
      t.timestamps
    end
  end
end
