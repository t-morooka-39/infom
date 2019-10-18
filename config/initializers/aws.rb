ActionMailer::Base.add_delivery_method(
  :ses,
  AWS::SES::Base,
  access_key_id: Rails.application.credentials.dig(:aws, :smtp_user_key),
  secret_access_key: Rails.application.credentials.dig(:aws, :smtp_user_secret),
  server: 'email.us-east-1.amazonaws.com'
)