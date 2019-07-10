class Picture < ApplicationRecord
  has_attached_file :image
  belongs_to :album
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
