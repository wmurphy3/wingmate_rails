class League < ApplicationRecord
  acts_as_paranoid
  
  has_many :league_users
end
