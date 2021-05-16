module BridgetownMenu
  class Menu
    attr_reader :name, :items

    def initialize(name)
      @name = name.to_sym
      @items = []
    end

    def title
      name.to_s.titleize
    end
  end
end
