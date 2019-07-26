class Photo < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  enum sharing_mode: [:isPublic, :isPrivate, :isFriend]
  acts_as_votable
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
  end
end
end
