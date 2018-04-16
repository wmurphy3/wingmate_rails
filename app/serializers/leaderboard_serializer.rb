class LeaderboardSerializer < ActiveModel::Serializer
  type :league
  attributes :id, :name, :users

  def users
    object.league_users.active.desc.map{ |l| {name: l.user.name.titleize, points: l.points} }
  end

end
