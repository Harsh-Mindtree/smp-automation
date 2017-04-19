When(/^I click on BBC iPlayer from menu$/) do
  home_page.iplayer_page.click
end

Then(/^I am navigated to BBC iPlayer page$/) do
  expect(iplayer_page.iplayer_logo).to be_truthy
end