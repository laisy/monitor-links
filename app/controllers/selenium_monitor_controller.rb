class SeleniumMonitorController < ApplicationController
  require 'selenium-webdriver'

  def create
    Link.all.each do |link|
      date = DateTime.now
    
      @driver = Selenium::WebDriver.for :chrome
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      @driver.get link.url
    
      path = "./app/assets/images/#{link.id}#{date}.png"
    
      @driver.save_screenshot(path)
      @driver.quit
    
      image = File.new(path, "r")
    
      s = Screenshot.new
      s.link_id = link.id
      s.image = image
      s.title = link.url
      s.save!
    
      image.close
    
      File.delete(path) if File.exist?(path)
    end
  end
end
