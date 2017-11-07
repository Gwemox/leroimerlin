class Tag < ApplicationRecord
  has_many :pictures
  has_many :linkpicturetags
end
