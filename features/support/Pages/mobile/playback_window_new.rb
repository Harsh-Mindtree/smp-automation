module Pages
  module Mobile
    class PlaybackWindow < Pages::BasePage

      element :playback_frame , '#smphtml5iframeplayer'
      element :play_cta , 'div.playlink__cta'
      element :pause_button, ".p_button.p_controlBarButton.p_pauseButton"
      element :control_bar, ".p_button.p_cta.p_iplayerIcon"
      element :skip_button, ".skip-button"
      element :app_banner_close, "i.icon.tviplayericon.tviplayericon-no"

      section :guidance_window, 'div#guidancePopup' do
        element :age_check, '#ageConfirmCheck'
        element :continue, '#pgAgeContinue'
        element :without_pg, 'a#toolTipPlay'
        element :with_pg, "a#pgTurnOn"
        element :enter_pin, "div#pinEntry > input"
        element :activate_pg, "a#pgActivate"

      end

      def click_play_cta
        puts "mobile"
        within_frame(playback_frame){
          play_cta.click
        }
      end

      def check_guidance_window(type)
        assert_text(:visible,type)
      end

      def check_age_checkbox
        guidance_window.age_check.checked?
      end

      def click_continue
        guidance_window.continue.click
      end

      def check_warning(warning)
        assert_text(:visible,warning)
      end

      def confirm_age
        guidance_window.age_check.click
      end

      def click_without_pg
        guidance_window.without_pg.click
      end

      def check_playback_started
        app_banner_close.click
        within_frame(playback_frame){
          $driver.driver.set_context('NATIVE_APP')
          action = Appium::TouchAction.new.tap(:fingers => 1).perform # calling touch action class from Appium
          $driver.driver.set_context('WEBVIEW')
          sleep(1)
          pause_button.visible?
        }
      end

      def click_with_pg
        guidance_window.with_pg.click
      end

      def enter_parental_pin(pin)
        guidance_window.enter_pin.send_keys pin
      end

      def activate_PG_pin
        $driver.driver.set_context('NATIVE_APP')
        page.driver.appium_driver.hide_keyboard
        $driver.driver.set_context('WEBVIEW')
        guidance_window.activate_pg.click
      end
    end
  end
end