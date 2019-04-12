class Api::V1::PostsController < Api::V1::BaseController
  def create
    @post = PostCreateService.create(post_params)

    respond_to do |format|
      if @post.valid?
        format.json { render json: { code: 200, post: PostSerializer.new(@post) }, status: 200 }
      else
        format.json { render json: { code: 422, errors: @post.errors.full_messages }, status: 422 }
      end
    end
  end

  private

  def post_params
    params.permit(:title, :body, :ip, :username)
  end
end
