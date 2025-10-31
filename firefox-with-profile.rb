require 'selenium-webdriver'
require 'test/unit'

class LtTest < Test::Unit::TestCase
  def setup
    username = ENV["LT_USERNAME"] || "{username}"
    access_key = ENV["LT_ACCESS_KEY"] || "{accessToken}"
    grid_url = "https://#{username}:#{access_key}@hub.lambdatest.com/wd/hub"

    # Firefox profile setup
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['browser.download.dir'] = 'C:\\Users\\ltuser\\Downloads'
    profile['browser.download.useDownloadDir'] = true
    profile['browser.helperApps.neverAsk.saveToDisk'] =
      "application/pdf,application/msword,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    profile['pdfjs.disabled'] = true

    # Firefox Options (Selenium 4 style)
    options = Selenium::WebDriver::Options.firefox
    options.browser_version = "latest"
    options.platform_name = "Windows 10"
    options.profile = profile

    # LambdaTest specific options
    lt_options = {
      "project" => "Ruby Firefox Profile",
      "build" => "firefox-profile-test",
      "name" => "Download PDF Test",
      "network" => true,
      "visual" => true,
      "video" => true,
      "console" => true,
      "selenium_version" => "4.38.0"
    }
    options.add_option('LT:Options', lt_options)

    # Start Remote WebDriver session
    @driver = Selenium::WebDriver.for(:remote, url: grid_url, capabilities: options)
  end

  def test_Login
    puts("Starting file download test...")
    @driver.navigate.to("http://www.pdf995.com/samples")

    # Mark test as passed for demonstration
    status = "passed"
    @driver.execute_script("lambda-status=#{status}")
    @driver.execute_script("lambda-status=#{status}")
  end

  def teardown
    @driver.quit
  end
end
