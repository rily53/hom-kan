class Calendar < ApplicationRecord

  validates :title, presence: true
  validate :schedule
  validate :member
  validates :start_date, presence: true
  validate :s_time
  validate :end_date
  validate :e_time

  belongs_to :user
  belongs_to :home

  def start_time
    self.start_date
    # カレンダーにイベント表示
    
  end

  def end_time
    self.end_date
  end

end
