module ApplicationHelper

  def link_to_with_icon(icon_name, *args, &block)
    args[0] = "<span class='glyphicon glyphicon-#{icon_name}'></span> #{args[0]}".html_safe
    link_to *args, &block
  end

end