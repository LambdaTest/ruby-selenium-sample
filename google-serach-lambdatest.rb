require 'selenium-webdriver'
require 'test/unit'


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
class LtTest < Test::Unit::TestCase
    
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
        username= "{username}"
        accessToken= "{accessToken}"
        gridUrl = "beta-hub.lambdatest.com/wd/hub"
 
        caps = {                       
            :browserName => "chrome",         
            :version =>   "67.0",         
            :platform =>  "win10",
            :name =>  "LambdaTest ruby google search name",
            :build =>  "LambdaTest ruby google search build",      
            :network =>  true,
            :visual =>  true,
            :video =>  true,
            :console =>  true
        }  
 
        puts (caps)
        # URL: https://{username}:{accessToken}@beta-hub.lambdatest.com/wd/hub
        @driver = Selenium::WebDriver.for(:remote,
            :url => "https://"+username+":"+accessToken+"@"+gridUrl,
            :desired_capabilities => caps)
    end
 


    def test_Login
        """
        Setup remote driver
        Params
        ----------
        Execute test:  navigate google.com search LambdaTest
        Result
        -------
        print title
        """
        puts("Searching lambdatest on google.com ")
        sleep(15)
        @driver.get("https://www.google.com/ncr")
        elem = @driver.find_element(:name, 'q')
        elem.send_keys("lambdatest.com")
        elem.submit()

        puts("Printing title of current page :"+@driver.title)
    end
 
  
 
    def teardown
        """
        Quit selenium driver
        """
        @driver.quit
    end
 
 
end