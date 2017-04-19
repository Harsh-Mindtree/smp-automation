When(/^I "([^"]*)" check Age verification Checkbox$/) do |action|
  case action
  when "do not"
    expect(playback_window.check_age_checkbox).to be_falsey
  when "do"
    playback_window.confirm_age
  end
end

When(/^I click on "([^"]*)" button$/) do |action|
  case action
  when 'Continue'
    playback_window.click_continue
  when 'Play'
    playback_window.activate_PG_pin
  end
end

When(/^I choose "([^"]*)" option on Parental Window$/) do |action|
  if action.include?('without')
    playback_window.click_without_pg
  elsif action.include?('on')
    playback_window.click_with_pg
  end
end

When(/^I enter "([^"]*)" (.*)$/) do |type, pin|
  playback_window.enter_parental_pin(pin)
end

Then(/^Playback video should get started$/) do
  expect(playback_window.check_playback_started).to be_truthy
end

Then(/^I should see "([^"]*)" warning$/) do |warning|
  playback_window.check_warning(warning)
end
