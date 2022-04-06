class Storehouse < ApplicationRecord

  belongs_to :user
  belongs_to :home

  validates :folder_name, presence: true
  validates :file_name, presence: true
  validates :file_memo

end
