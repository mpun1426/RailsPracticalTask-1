class Task < ApplicationRecord
  validate :blank_title
  validates :title, length: {maximum: 20}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_check
  validates :memo, length: {maximum: 147}

  def date_check
    if self.start_date.present? && self.end_date.present?
      errors.add(:end_date, "は開始日以降の日付を選択してください") if self.end_date < self.start_date
    end
  end

  def blank_title
    unless self.title.present?
      errors.add(:title, "は入力必須です")
    end
  end
end
