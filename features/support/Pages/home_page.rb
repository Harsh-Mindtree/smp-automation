module Pages
  class HomePage < Pages::BasePage
    set_url('/')

    element :iplayer_page,'div.orb-nav-links > ul > .orb-nav-iplayer'

  end
end