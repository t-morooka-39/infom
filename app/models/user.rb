class User < ApplicationRecord
  validates :name, presence: true,
    length: { minimum: 2, maximum: 20, allow_blank: true }
  validates :email, presence: true
  validates :birthday, presence: true
  validates :nickname, presence: true, uniqueness: true
end
