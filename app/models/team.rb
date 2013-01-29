class Team < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :restaurants
  has_many :currentRestaurants
end
