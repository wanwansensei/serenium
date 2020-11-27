require 'selenium-webdriver'
 
d = Selenium::WebDriver.for :chrome
 
d.get("https://www.uniqlo.com/jp/ja/spl/lineup/men/tops")
a1 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[2]/div').find_elements(:tag_name,'a').count
A1 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[2]/div').find_elements(:tag_name,'a')

puts a1

A1.each do |a1ele|
    puts a1ele.text
end