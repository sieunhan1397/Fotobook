class Photo < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  enum sharingMode: [:isPublic, :isPrivate, :isFriend]
end
