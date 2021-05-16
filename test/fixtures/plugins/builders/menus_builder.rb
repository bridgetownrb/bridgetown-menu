class MenusBuilder < SiteBuilder
  def build
    menu :main_menu do
      item "nav.home",    "/", localize: true
    
      localize do
        item "nav.about", "/about"
      end
    
      item "<strong>Posts</strong>",  "/posts"
    end    
  end
end
