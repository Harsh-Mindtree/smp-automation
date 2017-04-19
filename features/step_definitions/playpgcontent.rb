Given(/^I am on BBC iPlayer page$/) do
  iplayer_page.load
end

Given(/^I select any PG rated content$/) do
  visit("https://is.gd/ajoheh") # need to look again
end

Given(/^I choose "([^"]*)" option$/) do |arg1|
  iplayer_page.bbc_licence.have_licence.click
end

Given(/^I click on Play CTA$/) do
  playback_window.click_play_cta
end

Given(/^I see "([^"]*)" Window$/) do |type|
  case type
  when "Guidance"
    playback_window.check_guidance_window(type)
  when "Parental Guidance Lock"
    playback_window.check_guidance_window(type)
  end
end