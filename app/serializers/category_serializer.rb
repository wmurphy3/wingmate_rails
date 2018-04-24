class CategorySerializer < ActiveModel::Serializer
  type :category
  attributes :id, :name

end
