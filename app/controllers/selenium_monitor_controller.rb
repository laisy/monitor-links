class SeleniumMonitorController < ApplicationController
  before_action :set_flag_true, only: %i[ create ]
  require 'selenium-webdriver'

  def create
    while(@flag)

      Link.all.each do |link|
        date = DateTime.now
      
        # @driver = Selenium::WebDriver.for :chrome
        @driver = Selenium::WebDriver.for ENV['CHROME_DRIVER_PATH'] || :chrome
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

      sleep(10.seconds)
    end
  end

  def set_flag_true
    @flag = true
  end

  def set_flag_false
    @flag = false

    redirect_to screenshots_path
  end
end
