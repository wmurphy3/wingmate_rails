class UserAchievementSerializer < ActiveModel::Serializer
  type :user_achievement
  attributes :id, :name, :points, :completed_at, :description

  def name
    object.user.name
  end

  def points
    object.achievement.points
  end

  def completed_at
    object.created_at
  end

  def description
    object.achievement.name
  end

end
