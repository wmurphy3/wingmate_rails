class Achievement < ApplicationRecord
  belongs_to :category

  has_many :user_achievements
end
