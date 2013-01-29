class Restaurant < ActiveRecord::Base
  attr_accessible :name, :rate
  has_many :rates
  belongs_to :team
end
