module PagesHelper
  def get_widgets
    @page.get_placeholders.each do |placeholder|
      widgets = @page.widgets.by_placeholder(placeholder).all
      content_for placeholder.to_sym do
        widgets.map do|w|
          content = render_cell w.system_name.to_sym, :display , :widget => w
          management = "<div class=\"management\"><a href=\"#edit\">edit</a>&nbsp;<a href=\"#delete\">delete</a></div>".html_safe
          content_tag :li, management + content, :class => 'widget-wrap', :'data-id' => "widget_#{w.id}"
        end.join.html_safe
      end
    end
  end

  # Render placeholder (with widgets if exist)
  # @param type [:page, :theme] Layout for this page only or for every pages that use this theme
  # @param name [symbol] Name (id) for placeholder
  def placeholder(type, name)
    content = content_for name
    content_tag :ul, content, :id => name, :class => "placeholder_#{type.to_s}", :style => 'min-height: 100px;'
  end
end
