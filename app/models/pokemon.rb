class Pokemon < ApplicationRecord
  has_one_attached :picture
  has_one_attached :sprite
end
