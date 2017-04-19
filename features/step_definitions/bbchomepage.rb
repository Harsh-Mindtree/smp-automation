Given(/^I am on BBC Home Page$/) do
  home_page.load
end

When(/^I click on menu tab$/) do
  home_page_mobile.navigation_menu.click
end

When(/^I select "([^"]*)"$/) do |page|
  case page
  when 'iPlayer'
    home_page_mobile.iplayer_page.click
  end
end
