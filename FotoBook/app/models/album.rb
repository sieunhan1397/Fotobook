class Album < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  enum sharing_mode: [:isPublic, :isPrivate, :isFriend]
end
