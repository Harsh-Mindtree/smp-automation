module Pages
  class HomePageMobile < Pages::BasePage

    set_url('/')

    element :navigation_menu,'div#orb-nav-links'
    element :iplayer_page, 'div.orb-panel-content.b-g-p.b-r.orb-nav-sec > ul > li.orb-nav-iplayer'

  end
end