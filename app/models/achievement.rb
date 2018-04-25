class Achievement < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :category

  has_many :user_achievements
end
