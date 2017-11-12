class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to my_picture_path }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @picture = Picture.find(params[:picture_id])
  end

  private

    def picture_params
      params
        .require(:picture)
        .permit(
          :picture,
          :category_id,
          tag_ids: [])
        .merge(user_id: current_user.id)
    end
  end
