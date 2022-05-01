class Shelf < ApplicationRecord

  belongs_to :user
  belongs_to :home
  belongs_to :storehouse
  has_many_attached :images

  validates :file_name, presence: true
  validate :file_memo

end
