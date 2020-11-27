require 'selenium-webdriver'
 
d = Selenium::WebDriver.for :chrome
 
d.get("https://www.uniqlo.com/jp/ja/spl/lineup/men/tops")
a1 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[2]/div/div[3]/div').find_elements(:tag_name,'a').count

i=0
j=0


while i <= a1 do 
    A1 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[2]/div/div[3]/div').find_elements(:tag_name,'a')
    A1[i].click
    sleep 2
    
    a2 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[1]/div/section/div[4]/div[1]').find_elements(:tag_name,'a').count
    
    while j <= a2 do
        A2 = d.find_element(:xpath,'//*[@id="root"]/div/div/div[1]/div[4]/section/section/section[1]/div/section/div[4]/div[1]').find_elements(:tag_name,'a')
        A2[j].click
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
    i += 1
end