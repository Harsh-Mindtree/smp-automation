# smp-automation
A cucumber, capybara , siteprism framework for SMP test scripts

This framework in created using 
Ruby version: ruby 2.2.2p95 (2015-04-13 revision 50295) [i386-mingw32]

Install all gems required using "bundle install" command in project directory using CMD.

Commands in CMD to run features on desktop

- cucumber -t @desktop #to run all desktop features 
- cucumber -t @ParentalWindow #to run a particular feature using its tag

Commands in CMD to run it on Mobile

- cucumber -t @mobile device=mobile driver=appium #to run all Mobile features 
- cucumber -t @ParentalWindowMobile device=mobile driver=appium #to run a particular feature using its tag

