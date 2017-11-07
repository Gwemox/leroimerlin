class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
        
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
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
