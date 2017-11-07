class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  acts_as_votable
  has_many :linkpicturetags
  has_many :tags, through: :linkpicturetags
  belongs_to :category
  belongs_to :user
end
