CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'infom_images'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.dig(:s3, :access_key_id),
    aws_secret_access_key: Rails.application.credentials.dig(:s3, :secret_access_key),
    region: Rails.application.credentials.dig(:s3, :region),
    path_style: true
  }
  config.fog_public     = false
  config.enable_processing = false if Rails.env.test?
end