class Calendar < ApplicationRecord

  validates :title, presence: true
  validates :schedule, presence: true
  validates :start_time, presence: true

  belongs_to :user
  belongs_to :home

end
