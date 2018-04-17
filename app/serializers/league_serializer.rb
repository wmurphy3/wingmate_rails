class LeagueSerializer < ActiveModel::Serializer
  type :league
  attributes :id, :name, :league_type, :goal, :winner_id, :is_admin

  def is_admin
    object.admin_id == current_user.id
  end

  def goal
    object.time.nil? ? object.points : object.time
  end

end
