class LikeController < ApplicationController
  def like
    data = current_user.switchLike(params[:picture_id])
    render json: data.to_json
  end
end
