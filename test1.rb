require 'selenium-webdriver'
 
d = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 20)


d.get("https://www.uniqlo.com/jp/ja/search?q=%E3%83%88%E3%83%83%E3%83%97%E3%82%B9%20MEN")

sleep 2
while d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/div/section/div[5]/div/div[3]/button').displayed? 
    d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/div/section/div[5]/div/div[3]/button').click
    wait.until{d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/div/section/div[5]/div/div[3]/button').displayed?}
end


a2 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[1]/div/section/div[4]/div[1]').find_elements(:tag_name,'a').count

while i <= a1 do
    A1 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[1]/div/section/div[4]/div[1]').find_elements(:tag_name,'a')
    A1[i].click
    sleep 5

    buts = d.find_elements(:xpath,'//*[@id="accordion-id"]')
    buts.each do |but|
        but.click 
        sleep 1
    end
    

    name = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/div[2]/div[1]/div/h1')#商品名
    price = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/div[2]/div[1]/div/div[1]/span/div/div/span')#価格
    materials = d.find_element(:xpath,'//*[@id="accordion-id-content"]/div/ul/div[1]/ul').find_elements(:tag_name, 'p')#素材部分

    puts name.text
    puts price.text

    materials.each do |material|
        puts material.text
    end 
    
    d.navigate.back
    sleep 5 
    j += 1
end