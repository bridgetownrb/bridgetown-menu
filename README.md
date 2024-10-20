# Bridgetown::Menu

> [!WARNING]
> This plugin is considered "as-is" and I don't anticpate developing it any further. If you submit an interesting PR, I'm willing to merge it, but otherwise…it's done.

----

A Bridgetown plugin and Ruby component for defining and rendering navigation menus.

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-menu -g bridgetown_plugins
```

Then update your `plugins/site_builder.rb` file.

```rb
# plugins/site_builder.rb

class SiteBuilder < Bridgetown::Builder
  include BridgetownMenu::BuilderMethods

  # ...
end
```

Finally, create a new builder in your plugins folder to define your menus.

```rb
# plugins/builders/menus_builder.rb

class MenusBuilder < SiteBuilder
  def build
    # Use the DSL to define your menu
    menu :main_menu do
      localize do
        item "nav.home",      "/"
        item "nav.about",     "/about"
        item "nav.articles",  "/articles"
        item "nav.contact",   "/contact"
      end
    end    
  end
end
```

## Usage

Once you've defined a menu, you can render it using the `Bridgetown::Menu` component in a Ruby template:

```erb
<!-- src/_layouts/default.erb -->

<%= render Bridgetown::Menu.new(:main_menu, resource) %>
```

You can define multiple menus in `MenusBuilder` simply by providing different labels.

```rb
menu :main_menu do ... end
menu :footer_menu do ... end
```

```erb
<!-- src/_components/shared/footer.erb -->

<%= render Bridgetown::Menu.new(:footer_menu, resource) %>
```

## Localization

Menu localizations are loaded from your locale files in `src/_locales/{en,fr,zh,etc}.yml`

If you don't need to localize your menu, simply remove the `localize do ... end` block from your menu definition. You can also pass a `localize: true/false` argument to the `item` method directly when outside of a `localize` block.

> NOTE: In an upcoming version of Bridgetown later in 2021 which will support locale-based routing (aka `/es/slug`, `/de/slug`, etc.), we'll add support here as well.

## Subclassing and Customizing Menu Templates

If you need to customize the HTML markup of a menu—perhaps you're using a CSS framework such as Bootstrap—simply subclass `Bridgetown::Menu` and write your own `.erb` template. You can mix 'n' match multiple menu component classes throughout your site.

Here's an example of creating your own Bootstrap menu component.

```rb
# src/_components/bootstrap_menu.rb

class BootstrapMenu < Bridgetown::Menu
  def active_flag(item)
    if item_active?(item)
      ' class="nav-link active" aria-current="page"'
    else
      ' class="nav-link"'
    end.html_safe
  end
end
```

```erb
<!-- src/_components/bootstrap_menu.erb -->

<nav data-menu-name="<%= menu.name %>" aria-label="<%= menu.title %>" class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <%- menu.items.each do |item| %>
          <li class="nav-item">
            <a href="<%= item.url %>"<%= active_flag(item) %>>
              <%= item.localize? ? t(item.label) : item.label %>
            </a>
          </li>
        <%- end %>
      </ul>
    </div>
  </div>
</nav>
```

And then rendering the customized menu in a layout is easy-peasy.

```erb
<%= render BootstrapMenu.new(:main_menu, resource) %>
```

## TODO

Planned enhancements before the official 1.0 release:

- Pass arbitrary attributes to the `li` or the `a` of each menu item or to `nav`
- Allow metadata for a menu item for use cases in custom template
- Allow certain menu items to be renderable via custom components (think search field, extra icons, etc.)

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
