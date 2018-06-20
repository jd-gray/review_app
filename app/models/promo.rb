class Promo < ApplicationRecord
  belongs_to :meal

  validates_datetime :start_time, after: Time.zone.today
  validates_datetime :end_time, after: :start_time
  validates :discount_cents, presence: true

  scope :active, -> { where('start_time <= ? AND end_time >= ?', Time.current, Time.current) }

  def upcoming?
    start_time > Time.current
  end

  def ended?
    end_time < Time.current
  end
end
