class CreateCurrentRestaurants < ActiveRecord::Migration
  def change
    create_table :current_restaurants do |t|
      t.string   :name
      t.integer :team_id 
      t.timestamps
    end
  end
end
