Capybara.configure do |config|
  config.server_host = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
  config.server_port = 3001
  config.default_driver    = :selenium_chrome
  config.javascript_driver = :selenium_chrome
  config.default_max_wait_time = 5
  config.ignore_hidden_elements = true
end
Capybara.register_driver :selenium_chrome do |app|
  url = "http://chrome:4444/wd/hub"
  opts = { desired_capabilities: :chrome, browser: :remote, url: url }
  Capybara::Selenium::Driver.new(app, opts)
end

