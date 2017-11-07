class Linkpicturetag < ApplicationRecord
  belongs_to :picture
  belongs_to :tag
end
