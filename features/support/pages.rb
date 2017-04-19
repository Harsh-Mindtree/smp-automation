module Pages
  def self.included(base)

    device = ENV['device']
    puts device

    if device == 'mobile'
      base.include Pages::Mobile
      #base.include Sections::Mobile
    elsif device == 'tablet'
      base.include Pages::Tablet
      #base.include Sections::Tablet
    else
      puts 'loads desktop pages by default'
    end

  end
end

World(Pages)