class House < ApplicationRecord
  belongs_to :company

  has_one_attached :image
end
