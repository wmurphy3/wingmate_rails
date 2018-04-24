class UserAchievement < ApplicationRecord
  belongs_to :achievement
  belongs_to :user

  scope :mine, ->(id) { where(user_id: id) }
  scope :recent, ->() { where("created_at >= ?", 24.hours.ago) }
end
