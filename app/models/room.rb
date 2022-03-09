class Room < ApplicationRecord
  validates :pets, inclusion: { in: ['allowed', 'not allowed'] }
  validates :smoking, inclusion: { in: ['allowed', 'not allowed'] }
  validates :visitors, inclusion: { in: ['at any time', 'under request', 'not allowed'] }
  validates :pets, inclusion: { in: ['allowed', 'not allowed'] }
  validates :status, inclusion: { in: ['student', 'working', 'looking for job', 'just arrived'] }
  validates :utilities, inclusion: { in: ['included', 'not included'] }

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
            :status,
            presence: true
end
