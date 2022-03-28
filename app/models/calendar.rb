class Calendar < ApplicationRecord

  validates :title, presence: true
  validate :schedule
  validate :member
  validates :start_date, presence: true
  validate :start_time
  validate :end_date
  validate :end_time

  belongs_to :user
  belongs_to :home

end
