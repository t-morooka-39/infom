# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  ALLOWED_CONTENT_TYPES = '
    image/jpg
    image/png
    image/gif
    image/bmp
  '
end
