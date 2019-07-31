class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  ALLOWED_CONTENT_TYPES = %q{
    image/jpg
    image/png
    image/gif
    image/bmp
  }
end
