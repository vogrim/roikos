module ApplicationHelper

  def link_to_with_icon(icon_name, *args, &block)
    args[0] = label_with_item(icon_name, args[0])
    link_to *args, &block
  end

  def nav_link_item(icon_name, label, location, controller)
    className = (params[:controller] == controller) ? " active" : ""
    link_to_with_icon icon_name, label, location, :class => "item#{className}"
  end

  def label_with_item(icon_name, label)
    "<i class='#{icon_name} icon'></i> #{label}".html_safe
  end

end