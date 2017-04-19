Given(/^I am on BBC HTML5 page$/) do
  html_page.load
end

Given(/^I choose to "([^"]*)"$/) do |option|
  html_page.click_link(option)
end

Given(/^I should see "([^"]*)" button enabled$/) do |text|
  sleep(5)
  find_link(text).visible?
end
