class Api::V1::UsersIpController < Api::V1::BaseController
  def index
    @result = IpService.find_users

    respond_to do |format|
      format.json { render json: { code: 200, post: @result }, status: 200 }
    end
  end
end
