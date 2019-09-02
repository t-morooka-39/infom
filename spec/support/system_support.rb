module SystemSupport
  def wait_until(wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until yield
    end
  end
end