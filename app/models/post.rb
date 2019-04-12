class Post < ApplicationRecord
  belongs_to :user

  delegate :name, to: :user

  scope :top, ->(count) { includes(:user).order(total_rating: :desc).limit(count) }
end
