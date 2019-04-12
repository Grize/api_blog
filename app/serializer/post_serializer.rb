class PostSerializer < ActiveModel::Serializer
  attributes :post_id, :title, :body, :username
end
