class Api::V1::TopPostController < Api::V1::BaseController
  def index
    @posts = Post.top(params[:count].to_i)

    respond_to do |format|
      format.json { render json: { code: 200, posts: @posts.map { |p| RateSerializer.new(p) } }, status: 200 }
    end
  end
end
