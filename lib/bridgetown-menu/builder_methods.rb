module BridgetownMenu
  module BuilderMethods
    def menu(name, &block)
      dsl = BridgetownMenu::DSL.new(name)
      dsl.instance_eval(&block)
      Bridgetown::Menu.menus[name.to_sym] = dsl.menu
    end
  end
end
