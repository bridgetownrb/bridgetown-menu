# frozen_string_literal: true

require_relative "./helper"

class TestBridgetownMenu < Minitest::Test
  def setup
    @site = Bridgetown::Site.new(Bridgetown.configuration(
                                   "root_dir"    => root_dir,
                                   "source"      => source_dir,
                                   "destination" => dest_dir,
                                   "quiet"       => true
                                 ))
  end

  context "menu component" do
    setup do
      @site.process
      @contents = File.read(dest_dir("index.html"))
    end

    should "include the name and title in attributes" do
      assert_includes @contents, '<nav data-menu-name="main_menu" aria-label="Main Menu">'
    end

    should "activate the correct menu item" do
      assert_includes @contents, '<li menu-active><a href="/">Home</a></li>'
    end

    should "not localize by default" do
      assert_includes @contents, 
        '<li><a href="/posts">&lt;strong&gt;Posts&lt;/strong&gt;</a></li>'
    end
  end

  context "custom bootstrap navbar component" do
    setup do
      @site.process
      @contents = File.read(dest_dir("about.html"))
    end

    should "include the full nav tag" do
      assert_includes @contents, '<nav data-menu-name="main_menu" aria-label="Main Menu" class="navbar navbar-expand-lg navbar-light bg-light">'
    end

    should "display Bootstrap nav links" do
      assert_includes @contents, '<a href="/" class="nav-link">'
      assert_includes @contents, '<a href="/about" class="nav-link active" aria-current="page">'
    end
  end
end
