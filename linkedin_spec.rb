#filename:linkedin_login.#!/usr/bin/env ruby -wKU

require 'selenium-webdriver'

describe 'Login' do

	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
	end
	
	after(:each) do
		@driver.quit
	end

it 'succeeded' do
	#1 visit the main page of the site
	@driver.get 'https://www.linkedin.com/'
	#2 find the login button and (click it) or
	#3 find the login field and input username
	@driver.find_element(id: 'login-email').send_keys('syedwaqasaliraza@gmail.com')
	#4 find the password field and input password
	@driver.find_element(id: 'login-password').send_keys('twiXmel0N3')
	#5 find the login form submit button and click it
	#isnce the login button didn't have unique id so we're submitting the form instead
	@driver.find_element(class: 'login-form').submit
	# Add some wait
	@driver.manage.timeouts.implicit_waits = 10
	#7Leveraging some assertion
	@driver.find_element(css: '.menubar-lix').displayed?.should be_true

end

end
