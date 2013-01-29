class AddTeamIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :team_id, :integer
  end
end
