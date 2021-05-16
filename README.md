# Bridgetown::Menu

A Bridgetown plugin and Ruby component for defining and rendering navigation menus.

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-menu -g bridgetown_plugins
```

Then add `include BridgetownMenu::BuilderMethods` to `SiteBuilder` in your `plugins/site_builder.rb` file.

Finally, create a new builder in your plugins folder to define your menus.

```rb
# plugins/builders/menus_builder.rb

class MenusBuilder < SiteBuilder
  def build
    menu :main_menu do
      # use the DSL here to define your menu
    end    
  end
end
```

## Usage

…

## Testing

* Run `bundle exec rake test` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and Minitest together.

## Contributing

1. Fork it (https://github.com/bridgetownrb/bridgetown-menu/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
