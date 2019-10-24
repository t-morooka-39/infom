# frozen_string_literal: true

# Capybara.configure do |config|
#   config.server_host = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
#   config.server_port = 3001
#   config.default_driver    = :selenium_chrome
#   config.javascript_driver = :selenium_chrome
#   config.default_max_wait_time = 5
#   config.ignore_hidden_elements = true
# end
# Capybara.register_driver :selenium_chrome do |app|
#   url = 'http://chrome:4444/wd/hub'
#   # opts = { desired_capabilities: :chrome, browser: :remote, url: url }
#   # options.add_argument('window-size=800,550')
#   Capybara::Selenium::Driver.new(
#     app,
#     desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
#       chromeOptions: {
#         args: [
#           'window-size=1024,512'
#         ]
#       }
#     ),
#     browser: :remote,
#     url: url
#   )
# end
