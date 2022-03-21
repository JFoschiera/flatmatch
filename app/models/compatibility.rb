class Compatibility < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  belongs_to :like

  validates :user1, uniqueness: { scope: :user2 }
end
