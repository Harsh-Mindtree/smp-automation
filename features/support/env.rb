require 'selenium-webdriver'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'site_prism'
require 'capybara/poltergeist'
require 'appium_capybara'
require 'appium_lib'
require 'pry'

def appium_caps
  {
    'Nexus 5'=> { platformName: "android", deviceName: "Nexus 5", udid: "0aef21ee02e4221a", versionNumber: "6.0.1", browserName: "Chrome"},
    'SGS 6'=> { platformName: "android", deviceName: "Galaxy S6", udid: "02157df23bc41912", versionNumber: "5.1.1", browserName: "chrome"},
    'SGS 4'=> { platformName: "android", deviceName: "Galaxy S4", udid: "4d002a1783c930c1", versionNumber: "4.3", browserName: "chrome"}
  }
end

driver = ENV['DRIVER']

current_driver = 'selenium'.to_sym

if driver == 'appium'
  current_driver = driver.to_sym
  Capybara.register_driver current_driver do |app|
    caps = appium_caps.fetch('Nexus 5')
    puts "#{caps}"
    desired_caps = caps
    url = "http://127.0.0.1:4723/wd/hub/" # Url to your running appium server
    appium_lib_options = { server_url: url }
    all_options = { appium_lib:  appium_lib_options, caps: desired_caps }
    Appium::Capybara::Driver.new app, all_options
  end
else
  puts "in else"
  Capybara.register_driver current_driver do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end

CONFIG = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'smp_config.yml'))

base_url = CONFIG["base_url"]

Capybara.configure do |config|
  config.default_driver = current_driver
  config.default_max_wait_time = 10
  config.app_host = "http://#{base_url}"
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

World(Capybara::DSL)