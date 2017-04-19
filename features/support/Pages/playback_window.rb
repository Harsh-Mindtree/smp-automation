module Pages
  class PlaybackWindow < Pages::BasePage

    element :playback_frame , '#smphtml5iframeplayer'
    element :play_cta , 'div.playlink__cta'
    element :pause_icon, "svg.p_svg.p_pauseIcon"

    section :guidance_window, 'div#guidancePopup' do
      element :age_check, '#ageConfirmCheck'
      element :continue, '#pgAgeContinue'
      element :without_pg, 'a#toolTipPlay'
      element :with_pg, "a#pgTurnOn"
      element :enter_pin, "div#pinEntry > input"
      element :activate_pg, "a#pgActivate"
    end

    def click_play_cta
      within_frame(playback_frame){
        play_cta.click
      }
    end

    def check_guidance_window(type)
      within_frame(playback_frame){
        assert_text(:visible,type)
      }
    end

    def check_age_checkbox
      within_frame(playback_frame){
        guidance_window.age_check.checked?
      }
    end

    def click_continue
      within_frame(playback_frame){
        guidance_window.continue.click
      }
    end

    def check_warning(warning)
      within_frame(playback_frame){
        assert_text(:visible,warning)
      }
    end

    def confirm_age
      within_frame(playback_frame){
        guidance_window.age_check.click
      }
    end

    def click_without_pg
      within_frame(playback_frame){
        guidance_window.without_pg.click
      }
    end

    def check_playback_started
      within_frame(playback_frame){
        pause_icon.visible?
      }
    end

    def click_with_pg
      within_frame(playback_frame){
        guidance_window.with_pg.click
      }
    end

    def enter_parental_pin(pin)
      within_frame(playback_frame){
        guidance_window.enter_pin.send_keys pin
      }
    end

    def activate_PG_pin
      within_frame(playback_frame){
        guidance_window.activate_pg.click
      }
    end
  end
end