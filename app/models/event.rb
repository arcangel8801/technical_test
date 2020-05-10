class Event < ApplicationRecord
  has_many :schedules, dependent: :destroy

  validates :name, :starts_at, :ends_at, presence: true

  validate :date_range

  accepts_nested_attributes_for :schedules, reject_if: ->(a) { a[:content].blank? }, allow_destroy: true

  def date_range
    return if starts_at.nil? || ends_at.nil? || ends_at >= starts_at

    errors.add(:starts_at, I18n.t('messages.validate_date_range'))

  end

end
