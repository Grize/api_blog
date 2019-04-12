class UpdateRateService
  include ActiveModel::Validations
  include ActiveModel::Serialization

  validates :post, presence: true
  validates :rate, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1,
                                   less_than_or_equal_to: 5 }

  attr_reader :rate, :post, :rating

  def self.update(params, post)
    self.new(params, post).tap do |handler|
      handler.update_rate
    end
  end

  def initialize(params, post)
    @rate = params[:rate]
    @post = post
  end

  def update_rate
    @post.update!(total_rating: @post.total_rating + @rate.to_i,
                  rating_count: @post.rating_count + 1)
  end
end
