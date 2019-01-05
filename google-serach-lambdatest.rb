require 'selenium-webdriver'
require 'test/unit'


"""
LambdaTest selenium automation sample example
Configuration
----------
username: Username can be found at automation dashboard
accessToken:  AccessToken can be genarated from automation dashboard or profile section

Result
-------
Execute Test on lambdatest Distributed Grid perform selenium automation based 
"""
class LtTest < Test::Unit::TestCase
    def setup
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
        puts("Searching lambdatest on google.com ")
        sleep(15)
        @driver.get("https://www.google.com/ncr")
        elem = @driver.find_element(:name, 'q')
        elem.send_keys("lambdatest.com")
        elem.submit()

        puts("Printing title of current page :"+@driver.title)
    end
 
  
 
    def teardown
        @driver.quit
    end
 
 
end
