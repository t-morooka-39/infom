class TweetImage < ApplicationRecord
  belongs_to :tweet 
  has_one_attached :data
  attribute :new_data
  validate if: :new_data do
    if new_data.respond_to?(:content_type)
      unless new_data.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_data, invalid_image_type)
      end
    else
      errors.add(:new_data, :invalid)
    end
  end
  before_save do
    self.data = new_data if new_data
  end
end
