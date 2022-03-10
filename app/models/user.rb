class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :answers
  has_many :users1, class_name: "Compatibilities", foreign_key: "user1_id", dependent: :destroy
  has_many :users2, class_name: "Compatibilities", foreign_key: "user2_id", dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
