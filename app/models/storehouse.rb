class Storehouse < ApplicationRecord

  belongs_to :user
  belongs_to :home

  validates :folder_name, presence: true

end
