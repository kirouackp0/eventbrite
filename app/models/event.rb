class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
  
  validates :start_date, presence: true
  validate :start_date_not_modifiable_in_past
  validate :start_date_not_created_in_past
  validates :duration, presence: true
=begin
  validate :duration_multiple_five
  validate :duration_not_negative
=end
  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :description, presence: true, length: {minimum: 20, maximum: 1000}
  validates :price, presence: true, numericality: {minimum: 1, maximum: 1000}
  validates :location, presence: true

  private

  def start_date_not_modifiable_in_past
    if start_date_changed? && persisted? && past_event?
      errors.add(:start_date, "cannot be modified for past event")
    end
  end

  def start_date_not_created_in_past
    if start_date_changed? && past_start_date?
      errors.add(:start_date, "cannot be set to a past time and date")
    end
  end

  def past_start_date?
    start_date.present? && start_date < Time.now
  end

=begin
  def duration_multiple_five
    if duration_changed? && duration % 5 != 0
      errors.add(:duration, "must be a multiple of five")
    end
  end

  def duration_not_negative
    if duration_changed? && duration < 0
      errors.add(:duration, "must be at least zero minutes")
    end
  end
=end
end








