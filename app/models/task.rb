class Task < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :task, presence: true
  validates :deadline, presence: true
  validates :responsible_person, presence: true
  validates :status_id, presence: true

  belongs_to_active_hash :status
  belongs_to :user
  belongs_to :home

end
