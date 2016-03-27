#
# Generate a font awesome icon
# Currently does not support fa-stacks
#
def icon_tag(icon, options={})
  icon_class = "fa fa-#{icon}"
  unless options[:size].nil?
    icon_class << " fa-#{options[:size]}x"
  end
  content_tag(:i, nil, { :class => icon_class })
end
