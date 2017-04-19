module Pages
  class HTMLPage < Pages::BasePage
    set_url('/html5')

    element :opt_in_button,'div.button-container > div > a.btn'

  end
end