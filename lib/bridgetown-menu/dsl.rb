require "bridgetown-menu/menu"
require "bridgetown-menu/menu_item"

module BridgetownMenu
  class DSL
    attr_reader :menu

    def initialize(name)
      @menu = Menu.new(name)
      @localize_override = false
    end
    
    def item(label, url, localize: false)
      menu.items << MenuItem.new(label, url, localize: localize || @localize_override)
    end

    def localize
      @localize_override = true
      yield
      @localize_override = false
    end
  end
end
