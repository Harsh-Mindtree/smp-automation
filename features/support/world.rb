module SMPPages

  include ::Pages
  def iplayer_page
    @current_page = IplayerPage.new
  end

  def playback_window
    @current_page = PlaybackWindow.new
  end
  
  def html_page
    @current_page = HTMLPage.new
  end
  
  def home_page
    @current_page = HomePage.new
  end
  
  def home_page_mobile
    @current_page = HomePageMobile.new
  end

end

World(Pages,SMPPages)
