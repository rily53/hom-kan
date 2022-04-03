class Calendar < ApplicationRecord

  belongs_to :user
  belongs_to :home

  validates :title, presence: true
  validate :schedule
  validate :member
  validates :start_date, presence: true
  validate :s_time
  validate :end_date
  validate :e_time
  validate :start_end_check

  def start_time
    self.start_date
    # カレンダーにイベント表示
  end

  def end_time
    self.end_date
  end

  def start_end_check
    # 開始日が終了日より後に設定できない
    if start_date.present? == end_date.present?
    # dateに日付が入っている場合のみ
    errors.add(:end_date, "cannot be registered before start date") unless
    self.start_date < self.end_date
    end
  end

end
