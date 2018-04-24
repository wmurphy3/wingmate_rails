class League < ApplicationRecord
  acts_as_paranoid

  has_many :league_users

  scope :pending, ->() { where( league_users: {active: 0}) }
  scope :active, ->() { where( league_users: {active: 1}) }
end
