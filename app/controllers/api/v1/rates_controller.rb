class Api::V1::RatesController < Api::V1::BaseController
  before_action :set_post

  def update
    @result = UpdateRateService.update(rate_params, @post)

    respond_to do |format|
      if @result.valid?
        format.json { render json: { code: 200, post: RateSerializer.new(@result.post) }, status: 200 }
      else
        format.json { render json: { code: 422, errors: @result.errors.full_messages }, status: 422 }
      end
    end
  end

  private

  def set_post
    @post = Post.lock.find(params[:id])
  end

  def rate_params
    params.permit(:rate)
  end
end
