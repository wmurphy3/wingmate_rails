class LeagueUser < ApplicationRecord
  belongs_to :user
  has_many :leagues

  scope :desc, ->() { order("league_users.points DESC") }
  scope :active, ->() { where(active: 1) }
end
