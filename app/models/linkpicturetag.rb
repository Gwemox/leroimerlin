class Linkpicturetag < ApplicationRecord
  belongs_to :picture
  has_many :tags
end
