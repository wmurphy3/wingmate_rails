class AchievementSerializer < ActiveModel::Serializer
  type :achievement
  attributes :id, :name, :points, :times

  def times
    object.user_achievements.mine(current_user.id).count
  end

end
