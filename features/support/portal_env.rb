# frozen_string_literal: true

require 'appium_lib'
require 'appium_lib_core'
require 'better_errors'
require 'bundler/inline'
require 'byebug'
require 'colorize'
require 'csv'
require 'json'
require 'faker'
require 'parallel_tests'
require 'page-object'
require 'pry'
require 'pycall'
require 'require_all'
require 'rspec'
require 'rspec/expectations'
require 'rubygems'
require 'rubocop-rails'
require 'selenium-webdriver'
require 'securerandom'
require 'simplecov'
require 'stripe'
require 'syntax'
require 'touch_action'
require 'watir'
require 'watir-scroll'

require_relative '../../features/warehouse/Method_Warehouse.rb'
require_relative '../../features/support/android_helpers/logic/helper_methods/history_helpers.rb'

include MethodWarehouse
include HistoryHelpers
include Selenium

SimpleCov.start

# ENV['HOST'] = 'app-stage' if ENV['HOST'].nil?
 ENV['HOST'] = 'app-qa' if ENV['HOST'].nil?
#ENV['HOST'] = 'app' if ENV['HOST'].nil?

Before do  #Browser Env
	chromedriver_path = File.join(File.absolute_path('../..', File.dirname(__FILE__)),"chromedriver.exe")
	puts chromedriver_path
	Selenium::WebDriver::Chrome::Service.driver_path = chromedriver_path
	options = Selenium::WebDriver::Chrome::Options.new
	 #options = Selenium::WebDriver::Firefox::Options.new
	# options = Selenium::WebDriver::Ie::Options.new
	# options = Selenium::WebDriver::Edge::Options.new
	# options = Selenium::WebDriver::Safari::Options.new
	# options.add_argument('--headless') # configure the driver to run in headless mode
	options.add_preference('profile.managed_default_content_settings.notifications', 1)
	options.add_preference('profile.managed_default_content_settings.cookies', 1)
	options.add_preference('profile.managed_default_content_settings.plugins', 1)
	options.add_preference('profile.managed_default_content_settings.geolocation', 1)
	options.add_preference('profile.managed_default_content_settings.images', 1)
	options.add_preference('profile.managed_default_content_settings.media_stream', 1)
	options.add_preference('profile.managed_default_content_settings.popups', 1)
	$web_driver = Selenium::WebDriver.for :chrome, options: options
	 #$web_driver = Selenium::WebDriver.for :firefox, options: options, prefs: preferences
	# $web_driver = Selenium::WebDriver.for :ie, options: options, prefs: preferences
	# $web_driver = Selenium::WebDriver.for :edge, options: options, prefs: preferences
	# $web_driver = Selenium::WebDriver.for :safari, options: options, prefs: preferences
	$web_driver.manage.timeouts.page_load = 360
	$web_driver.manage.window.maximize
	Selenium::WebDriver::Wait.new(timeout: 10)
	$web_driver.manage.timeouts.implicit_wait = 10
	$web_driver.navigate.to "https://#{ENV['HOST']}.hi.guru/"
	$web_driver.navigate.to "https://google.com/"
end