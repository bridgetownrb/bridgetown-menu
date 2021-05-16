module BridgetownMenu
  class MenuItem
    attr_reader :label, :url, :localize

    def initialize(label, url, localize: false)
      @label, @url, @localize = label, url, localize
    end

    def localize?
      localize
    end
  end
end
