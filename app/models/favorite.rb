class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :tweet

  validate do
    unless member && member.favorite?(tweet)
      errors.add(:base, :invalid)
    end
  end
end
