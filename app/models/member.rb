class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :first_name, :last_name, :sex, presence: true
  validates :first_name, :last_name, length: {maximum: 10}
  validates :sex, numericality:{
    only_integer: true,
    greater_than: 0,
    less_than: 3,
    allow_blank: true
  }
  has_many :tweets, dependent: :destroy
end
