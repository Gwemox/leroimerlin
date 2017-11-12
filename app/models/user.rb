class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pictures

  has_many :likes
  acts_as_voter

  def switchLike(picture_id)
    result = {picture_id: picture_id, sucess: false}
    image = Picture.find(picture_id)
    if voted_for? image
      unlike image
      result[:liked] = false
    else
      likes image
      result[:liked] = true
    end
    result[:success] =  true
    result[:number_like] = image.get_likes.size

    return result
  end

end
