class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_check
  validates :memo, length: { maximum: 500 }

  def end_date_check
    if self.start_date != nil && self.end_date != nil && self.start_date > self.end_date
      errors.add(:end_date, "は開始日より前の日付は選択出来ません。")
    end
  end

end
