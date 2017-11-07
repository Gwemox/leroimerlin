class Tag < ApplicationRecord
  has_many :linkpicturetags
  has_many :pictures, through: :linkpicturetags
end
