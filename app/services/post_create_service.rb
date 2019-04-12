class PostCreateService
  include ActiveModel::Validations
  include ActiveModel::Serialization

  validates :title, presence: true
  validates :body, presence: true
  validates :ip, presence: true
  validates :username, presence: true

  attr_reader :username, :title, :body, :ip, :post_id

  def self.create(params)
    self.new(params).tap do |model|
      model.create_post
    end
  end

  def initialize(params)
    @username = params[:username]
    @title = params[:title]
    @body = params[:body]
    @ip = params[:ip]
  end

  def create_post
    if valid?
      user = User.find_or_create_by!(name: @username)

      @post_id = Post.create(
        user: user,
        title: @title,
        body:  @body,
        user_ip: @ip,
        username: @username
      ).id
    end
  end
end
