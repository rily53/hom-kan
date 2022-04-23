class Storehouse < ApplicationRecord

  belongs_to :user
  belongs_to :home
  has_many_attached :images

  validates :folder_name, presence: true
  validates :file_name, presence: true
  validate :file_memo

end
