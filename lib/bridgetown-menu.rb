# frozen_string_literal: true

require "bridgetown"
require "bridgetown-menu/dsl"
require "bridgetown-menu/builder_methods"

Bridgetown::PluginManager.new_source_manifest(
  origin: BridgetownMenu,
  components: File.expand_path("../components", __dir__)
)
