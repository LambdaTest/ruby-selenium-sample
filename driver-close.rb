require 'selenium-webdriver'
require 'test/unit'

class LtTest < Test::Unit::TestCase
  def setup
    username = ENV["LT_USERNAME"] || "{username}"
    access_key = ENV["LT_ACCESS_KEY"] || "{accessToken}"
    grid_url = "https://#{username}:#{access_key}@hub.lambdatest.com/wd/hub"

    # Chrome Options (Selenium 4 style)
    options = Selenium::WebDriver::Options.chrome
    options.browser_version = "latest"
    options.platform_name = "Windows 10"

    # LambdaTest options
    lt_options = {
      "project" => "Ruby Chrome Multi-Tab Test",
      "build" => "LambdaTest ruby google search build",
      "name" => "LambdaTest ruby google search name",
      "network" => false,
      "visual" => false,
      "video" => true,
      "console" => false
    }
    options.add_option('LT:Options', lt_options)

    # Start driver
    @driver = Selenium::WebDriver.for(:remote, url: grid_url, capabilities: options)
  end

  def test_Login
    puts("Opening multiple tabs test...")
    @driver.navigate.to("https://lambdatest.github.io/sample-todo-app/")
    @driver.execute_script("window.open('https://google.com/')")
    @driver.execute_script("window.open('http://www.pdf995.com/samples')")

    tabs = @driver.window_handles
    assert_equal(3, tabs.size, "Expected 3 tabs but found #{tabs.size}")
    sleep(1)

    # Close last tab
    @driver.switch_to.window(@driver.window_handles.last)
    @driver.close
    assert_equal(2, @driver.window_handles.size)

    # Close another tab
    @driver.switch_to.window(@driver.window_handles.last)
    @driver.close
    assert_equal(1, @driver.window_handles.size)

    # Back to main and perform actions
    @driver.switch_to.window(@driver.window_handles.last)
    elem1 = @driver.find_element(:name, 'li1')
    elem2 = @driver.find_element(:name, 'li2')
    elem1.click
    elem2.click
    puts("Test executed successfully.")
    @driver.execute_script('lambda-status=passed')
  rescue => e
    @driver.execute_script('lambda-status=failed')
    raise e
  end

  def teardown
    @driver.quit
  end
end
