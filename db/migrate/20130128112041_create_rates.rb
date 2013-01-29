class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.float  :point
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
