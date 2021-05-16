class BootstrapMenu < Bridgetown::Menu
  def active_flag(item)
    if item_active?(item)
      ' class="nav-link active" aria-current="page"'
    else
      ' class="nav-link"'
    end.html_safe
  end
end