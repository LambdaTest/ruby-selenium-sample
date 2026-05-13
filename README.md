# Run Selenium Tests With Capybara — TestMu AI (Formerly LambdaTest)

![Group 7552](https://user-images.githubusercontent.com/95698164/174256293-77d3c07c-0455-4671-bc07-4657ec3b03c7.png)

<p align="center">
  <a href="https://www.testmuai.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample" target="_bank">Blog</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample" target="_bank">Docs</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample" target="_bank">Learning Hub</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/newsletter/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample" target="_bank">Newsletter</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/certifications/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample" target="_bank">Certifications</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.youtube.com/@TestMuAI" target="_bank">YouTube</a>
</p>
&emsp;
&emsp;
&emsp;

*Learn how to use Ruby framework to configure and run your Java automation testing scripts on the TestMu AI platform*

[<img height="58" width="200" src="https://user-images.githubusercontent.com/70570645/171866795-52c11b49-0728-4229-b073-4b704209ddde.png">](https://accounts.lambdatest.com/register)

## Table Of Contents

* [Pre-requisites](#pre-requisites)
* [Run-Your-First-Test](#run-your-first-test)
* [Executing-The-Test](#executing-the-test)
* [Testing Locally Hosted or Privately Hosted Projects](#testing-locally-hosted-or-privately-hosted-projects)

## Pre-requisites

Before you can start performing Ruby automation testing with Selenium, you would need to:

* Install **Ruby** and **gem** on your local system. Follow these instructions to install on different operating systems.

  * For **Windows**, you can download from the [official website](https://rubyinstaller.org/downloads/).
  * For **Linux** or **Ubuntu**, you can run a simple apt command like below:
  ```bash
  sudo apt-get install ruby-full
  ```
  * For **macOS**, you can run a [Homebrew](https://brew.sh/) command like this:
  ```bash
  brew install ruby
  ```
* To run tests in parallel you will require the [parallel_tests](https://github.com/grosser/parallel_tests) gem.
* TestMu AI binary file for running tests on your locally hosted web pages.

### Installing Selenium Dependencies and Tutorial Repo

Clone the TestMu AI’s [ruby-selenium-sample repository](https://github.com/LambdaTest/ruby-selenium-sample) and navigate to the code directory as shown below:
```bash
git clone https://github.com/LambdaTest/ruby-selenium-sample.git
cd ruby-selenium-sample
```
Install selenium dependencies for Ruby automation testing.
```bash
gem install bundler
bundle install
```
### Setting up Your Authentication
Make sure you have your TestMu AI credentials with you to run test automation scripts with Jest on TestMu AI Selenium Grid. You can obtain these credentials from the [TestMu AI Automation Dashboard](https://automation.lambdatest.com/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample) or through TestMu AI Profile.

Set TestMu AI Username and Access Key in environment variables.
 * For Linux/macOS:
 `export LT_USERNAME="YOUR_USERNAME" export LT_ACCESS_KEY="YOUR ACCESS KEY"`
 * For Windows:
 `set LT_USERNAME="YOUR_USERNAME" set LT_ACCESS_KEY="YOUR ACCESS KEY"`

## Run Your First Test

### Sample Test with Ruby

**Test Scenario:** The to-do list example mentioned in the [lambdatest.rb](https://github.com/LambdaTest/ruby-selenium-sample/blob/master/todo-click-test.rb) sample file would help you to execute your automation test using Ruby.

### Configuration of Your Test Capabilities

In the test script, you need to update your test capabilities. In this code, we are passing browser, browser version, and operating system information, along with TestMu AI Selenium grid capabilities via capabilities object. The capabilities in the above code are defined as:
```ruby
caps = {                       
            :browserName => "chrome",         
            :version =>   "latest",         
            :platform =>  "windows 10",
            :geoLocation =>  "US",
            :name =>  "LambdaTest ruby google search name",
            :build =>  "LambdaTest ruby google search build",      
            :network =>  false,
            :visual =>  false,
            :video =>  true,
            :console =>  false
        }  
```
> You can generate capabilities for your test requirements with the help of our inbuilt **[Capabilities Generator tool](https://www.testmuai.com/capabilities-generator/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample)**.

### Executing the Test

To execute the test script, run the following script on terminal/cmd.
```bash
bundle exec ruby todo-click-test.rb 
```
Your test results would be displayed on the test console (or command-line interface if you are using terminal/cmd) and on [TestMu AI automation dashboard](https://automation.lambdatest.com/build/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample). TestMu AI Automation Dashboard will help you view all your text logs, screenshots and video recording for your entire automation tests.

## Testing Locally Hosted or Privately Hosted Projects

You can test your locally hosted or privately hosted projects with [TestMu AI Selenium grid cloud](https://www.testmuai.com/selenium-automation/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample) using TestMu AI Tunnel app. All you would have to do is set up an SSH tunnel using TestMu AI Tunnel app and pass toggle `tunnel = True` via desired capabilities. TestMu AI Tunnel establishes a secure SSH protocol based tunnel that allows you in testing your locally hosted or privately hosted pages, even before they are made live.

>Refer our [TestMu AI Tunnel documentation](https://www.testmuai.com/support/docs/testing-locally-hosted-pages/) for more information.

Here’s how you can establish TestMu AI Tunnel.

>Download the binary file of:
>* [TestMu AI Tunnel for Windows](https://downloads.lambdatest.com/tunnel/v3/windows/64bit/LT_Windows.zip)
* [TestMu AI Tunnel for Mac](https://downloads.lambdatest.com/tunnel/v3/mac/64bit/LT_Mac.zip)
* [TestMu AI Tunnel for Linux](https://downloads.lambdatest.com/tunnel/v3/linux/64bit/LT_Linux.zip)

Open command prompt and navigate to the binary folder.

Run the following command:
```bash
LT -user {user’s login email} -key {user’s access key}
```
So if your user name is lambdatest@example.com and key is 123456, the command would be:
```bash
LT -user lambdatest@example.com -key 123456
```
Once you are able to connect **TestMu AI Tunnel** successfully, you would just have to pass on tunnel capabilities in the code shown below :

**Tunnel Capability**
```ruby
caps = {             
            ...          
            :tunnel => true,         
            ...
        }  
```
## Additional Links

* [Advanced Configuration for Capabilities](https://www.testmuai.com/support/docs/selenium-automation-capabilities/)
* [How to test locally hosted apps](https://www.testmuai.com/support/docs/testing-locally-hosted-pages/)
* [How to integrate TestMu AI with CI/CD](https://www.testmuai.com/support/docs/integrations-with-ci-cd-tools/)

## Documentation & Resources :books:

      
Visit the following links to learn more about TestMu AI's features, setup and tutorials around test automation, mobile app testing, responsive testing, and manual testing.

* [TestMu AI Documentation](https://www.testmuai.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample)
* [TestMu AI Blog](https://www.testmuai.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample)
* [TestMu AI Learning Hub](https://www.testmuai.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample)    

## TestMu AI Community :busts_in_silhouette:

The [TestMu AI Community](https://community.testmuai.com/?utm_source=github&utm_medium=repo&utm_campaign=ruby-selenium-sample) allows people to interact with tech enthusiasts. Connect, ask questions, and learn from tech-savvy people. Discuss best practises in web development, testing, and DevOps with professionals from across the globe 🌎

## What's New At TestMu AI ❓

To stay updated with the latest features and product add-ons, visit [Changelog](https://changelog.lambdatest.com/)

## 🚀 [LambdaTest is Now TestMu AI](https://www.testmuai.com/lambdatest-is-now-testmuai/)

👋 Welcome to TestMu AI, the next evolution of LambdaTest. As of January 2026, LambdaTest has officially rebranded to TestMu AI. We have evolved from a cross-browser testing cloud into a unified, AI-native quality engineering platform designed for the modern DevOps era.

Whether you have been part of the LambdaTest community for years or are just discovering TestMu AI, our mission remains the same: to help you ship faster with high-scale test execution, autonomous testing, and deep quality analytics.

**🔄 Our Rebrand Journey**

We chose the name TestMu AI to reflect our shift towards intelligent, autonomous testing. While our identity has changed, our core technology and commitment to the testing community stay the same.

**✨ Specialties**

- 🤖 AI-Native Test Execution (Formerly LambdaTest)
- ⚡ Autonomous Test Automation
- 🌐 Cross-Browser & Mobile Testing
- 📊 Unified Quality Intelligence

👉 Find [LambdaTest's New Home](https://www.testmuai.com/).