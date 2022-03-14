class Room < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  PETSPER = ['allowed', 'not allowed']
  SMOKEPER = ['allowed', 'not allowed']
  VISITPER = ['at any time', 'under request', 'not allowed']
  UTILIPER = ['included', 'not included']

  validates :pets, inclusion: { in: PETSPER }
  validates :smoking, inclusion: { in: SMOKEPER }
  validates :visitors, inclusion: { in: VISITPER }
  validates :utilities, inclusion: { in: UTILIPER }

  validates :roommates,
            :size,
            :address,
            :city,
            :start_date,
            :end_date,
            :pets,
            :smoking,
            :visitors,
            :description,
            :floor,
            :price,
            presence: true
end
