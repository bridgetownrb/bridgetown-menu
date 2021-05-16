module Bridgetown
  class Menu < Bridgetown::Component
    attr_reader :menu, :resource

    class << self
      def menus
        @menus ||= {}
      end
    end

    def initialize(name, resource)
      @menu = Bridgetown::Menu.menus[name.to_sym]
      raise "The :#{name} menu has not been defined" if @menu.nil?

      @resource = resource
    end

    def active_flag(item)
      " menu-active" if item_active?(item)
    end

    def item_active?(item)
      (item.url == "/" && resource.relative_url == "/") || (item.url != "/" && resource.relative_url.starts_with?(item.url))
    end
  end
end
