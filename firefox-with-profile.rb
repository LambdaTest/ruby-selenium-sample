# Firefox profile Selenium 3 on Ruby
require 'selenium-webdriver'
require 'test/unit'
 
 
class LtTest < Test::Unit::TestCase
 
   def setup
 
       username= ENV["LT_USERNAME"] || "{username}"
       accessToken= ENV["LT_ACCESS_KEY"] || "{accessToken}"
       gridUrl = "hub.lambdatest.com/wd/hub"
       profile = Selenium::WebDriver::Firefox::Profile.new
       profile['browser.download.dir'] = 'C:\Users\ltuser\Downloads'
       profile['browser.download.useDownloadDir'] = true
       profile['browser.helperApps.neverAsk.saveToDisk'] = "application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.presentationml.slide, application/vnd.openxmlformats-officedocument.presentationml.slideshw, application/vnd.openxmlformats-officedocument.presentationml.template, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.openxmlformats-officedocument.spreadsheetml.template, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.wordprocessingml.template, application/vnd.ms-powerpoint, application/vnd.ms-powerpoint.addin.macroenabled.12, application/vnd.ms-powerpoint.slide.macroenabled.12, application/vnd.ms-powerpoint.presentation.macroenabled.12, appliation/vnd.ms-powerpoint.slideshow.macroenabled.12, application/vnd.ms-powerpoint.template.macroenabled.12, application/vnd.ms-word.document.macroenabled.12, application/vnd.ms-word.template.macroenabed.12, application/vnd.ms-excel, application/vnd.ms-excel.addin.macroenabled.12, application/vnd.ms-excelsheet.binary.macroenabled.12, application/vnd.ms-excel.template.macroenabled.12, application/vnd.ms-excel.sheet.macroenabled.12, application/x-mscardfile, application/onenote, application/msword, application/vnd.ms-xpsdocument, application/octet-stream, application/vn.contact.cmsg, application/doc, application/docx, application/vnd.3m.post-it-notes, application/x-7z-compressed, application/pdf, application/x-pdf, application/mp21, application/mp4, application/x-rar-compressed, application/rtf, application/xml, application/zip, image/x-ms-bmp, image/bmp, image/jpeg, image/png, image/x-xbitmap, image/tiff, text/plain-bas, text/csv, text/html, text/tab-separated-values, text/plain, text/x-vcalendar, text/x-vcard, text/yaml, video/x-msvieo, video/x-f4v, video/x-flv, video/x-fli, video/h261, video/h263, video/h264, video/jpm, video/jpeg, video/x-m4v, video/x-ms-wmv, video/x-ms-wvx, video/vnd.mpegurl, video/mpeg, video/mj2, video/mp4, audio/midi, audio/vnd.rip, audio/x-mpegurl, audio/mpeg, audio/mp4, audio/basic, audio/x-wav, message/rfc82"
       profile['browser.helperApps.neverAsk.openFile'] = "application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.presentationml.slide, application/vnd.openxmlformats-officedocument.presentationml.slideshw, application/vnd.openxmlformats-officedocument.presentationml.template, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.openxmlformats-officedocument.spreadsheetml.template, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.wordprocessingml.template, application/vnd.ms-powerpoint, application/vnd.ms-powerpoint.addin.macroenabled.12, application/vnd.ms-powerpoint.slide.macroenabled.12, application/vnd.ms-powerpoint.presentation.macroenabled.12, appliation/vnd.ms-powerpoint.slideshow.macroenabled.12, application/vnd.ms-powerpoint.template.macroenabled.12, application/vnd.ms-word.document.macroenabled.12, application/vnd.ms-word.template.macroenabed.12, application/vnd.ms-excel, application/vnd.ms-excel.addin.macroenabled.12, application/vnd.ms-excelsheet.binary.macroenabled.12, application/vnd.ms-excel.template.macroenabled.12, application/vnd.ms-excel.sheet.macroenabled.12, application/x-mscardfile, application/onenote, application/msword, application/vnd.ms-xpsdocument, application/octet-stream, application/vn.contact.cmsg, application/doc, application/docx, application/vnd.3m.post-it-notes, application/x-7z-compressed, application/pdf, application/x-pdf, application/mp21, application/mp4, application/x-rar-compressed, application/rtf, application/xml, application/zip, image/x-ms-bmp, image/bmp, image/jpeg, image/png, image/x-xbitmap, image/tiff, text/plain-bas, text/csv, text/html, text/tab-separated-values, text/plain, text/x-vcalendar, text/x-vcard, text/yaml, video/x-msvieo, video/x-f4v, video/x-flv, video/x-fli, video/h261, video/h263, video/h264, video/jpm, video/jpeg, video/x-m4v, video/x-ms-wmv, video/x-ms-wvx, video/vnd.mpegurl, video/mpeg, video/mj2, video/mp4, audio/midi, audio/vnd.rip, audio/x-mpegurl, audio/mpeg, audio/mp4, audio/basic, audio/x-wav, message/rfc82"
       profile['pdfjs.disabled'] = true
 
       caps = {                      
           :browserName => "firefox",        
           :version =>   "latest",        
           :platform =>  "win10",  
           :network =>  true,
           :selenium_version => "3.141.59",
           :visual =>  true,
           :video =>  true,
           :console =>  true,
           :javascriptEnabled => true,
           :build => "firefox-profile-test",
           :firefox_profile => profile
       } 
       puts (caps)
       @driver = Selenium::WebDriver.for(:remote,
           :url => "https://"+username+":"+accessToken+"@"+gridUrl,
           :desired_capabilities => caps)
   end
 
   def test_Login
 
       puts("Download test")
       sleep(5)
       @driver.get("http://www.pdf995.com/samples")
       elem1 = @driver.find_element(:xpath, "//*[contains(text(), 'widgets.pdf')]")
       elem1.click;
    if (@driver.execute_script('lambda-file-exists=widgets.pdf'))
        @driver.execute_script('lambda-status=passed');
       else
       @driver.execute_script('lambda-status=failed');
       end
       
   end
   def teardown
       @driver.quit
   end
end
