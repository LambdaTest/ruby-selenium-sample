require 'selenium-webdriver'
require 'test/unit'



class LtTest < Test::Unit::TestCase
    """
    LambdaTest selenium automation sample example
    Configuration
    ----------
    username: Username can be found at automation dashboard
    accessToken:  AccessToken can be generated from automation dashboard or profile section

    Result
    -------
    Execute Ruby Automation Tests on LambdaTest Distributed Selenium Grid 
    """

    
    def setup
        """
        Setup remote driver
        Params
        ----------
        platform : Supported platform - (Windows 10, Windows 8.1, Windows 8, Windows 7,  macOS High Sierra, macOS Sierra, OS X El Capitan, OS X Yosemite, OS X Mavericks)
        browserName : Supported platform - (chrome, firefox, Internet Explorer, MicrosoftEdge)
        version :  Supported list of version can be found at https://www.lambdatest.com/capabilities-generator/

        Result
        -------
        """
        username= ENV["LT_USERNAME"] || "{username}"
        accessToken= ENV["LT_ACCESS_KEY"] || "{accessToken}"
        gridUrl = "hub.lambdatest.com/wd/hub"
 
        caps = {                       
            :browserName => "chrome",         
            :version =>   "latest",         
            :platform =>  "win10",
            :name =>  "LambdaTest ruby google search name",
            :build =>  "LambdaTest ruby google search build",      
            :network =>  false,
            :visual =>  false,
            :video =>  true,
            :console =>  false
        }  
 
        puts (caps)
        # URL: https://{username}:{accessToken}@hub.lambdatest.com/wd/hub
        @driver = Selenium::WebDriver.for(:remote,
            :url => "https://"+username+":"+accessToken+"@"+gridUrl,
            :desired_capabilities => caps)
    end
 


    def test_Login
        """
        Setup remote driver
        Params
        ----------
        Execute test:  navigate to https://lambdatest.github.io/sample-todo-app/
        Result
        -------
        print Success Message
        """
        puts("Opening 3 tabs")
        sleep(2)
        @driver.get("https://lambdatest.github.io/sample-todo-app/")
        @driver.execute_script("window.open('https://google.com/')")
        @driver.execute_script("window.open('http://www.pdf995.com/samples')")
        tabs = @driver.window_handles
        assert_equal(3, tabs.size, "Expected 3 tabs but found " + tabs.size.to_s)
        sleep(2)
        @driver.switch_to.window(@driver.window_handles.last)
        @driver.execute_script("window.close('http://www.pdf995.com/samples')")
        tabs = @driver.window_handles
        assert_equal(2, tabs.size, "Expected 2 tabs but found " + tabs.size.to_s)
        sleep(2)
        @driver.switch_to.window(@driver.window_handles.last)
        @driver.close
        tabs = @driver.window_handles
        assert_equal(1, tabs.size, "Expected 1 tab but found " + tabs.size.to_s)
        sleep(5)
        @driver.switch_to.window(@driver.window_handles.last)
        elem1 = @driver.find_element(:name, 'li1')
        elem1.click;

        elem2 = @driver.find_element(:name, 'li2')
        elem2.click;
        puts("Test Ran Successfully.")
    end
 
  
 
    def teardown
        """
        Quit selenium driver
        """
        @driver.quit
    end
 
 
end
