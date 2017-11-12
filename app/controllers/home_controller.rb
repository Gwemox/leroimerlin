class HomeController < ApplicationController

  def index
    @pictures = Picture.filter(params);


    if request.xhr?
      data = render_to_string partial: "home/picture"
      last_id = 0
      if @pictures.last
        last_id = @pictures.last.id
      end
      render json: {data: data, last_id: last_id}.to_json
    end
  end

  def myPicture
    if current_user
      @pictures = Picture.filter(user_id: current_user.id);
      render :index
    else
      redirect_to root_path
    end
  end
end
