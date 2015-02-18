module ApplicationHelper

  def set_page_title(title, return_title = true)
    content_for :title, title.html_safe
    if return_title == true
      title
    end
  end

  def link_to_with_icon(icon_name, *args, &block)
    args[0] = label_with_item(icon_name, args[0])
    link_to *args, &block
  end

  def nav_link_item(label, location, controller, icon_name = false)
    className = (params[:controller] == controller) ? " active" : ""
    if icon_name
      link_to_with_icon icon_name, label, location, :class => "item#{className}"
    else
      link_to label, location, :class => "item#{className}"
    end
  end

  def label_with_item(icon_name, label)
    fa_icon icon_name, text: label
  end

  # Translate helper for formfields
  def t_formfield(field)
    t("simple_form.labels.defaults.#{field}")
  end

  def t_model_name(model_name)
    t("activerecord.models.#{model_name}.other")
  end

end