class Picture < ApplicationRecord
  acts_as_votable
  has_many :linkpicturetags
  belongs_to :category
  belongs_to :user
end
