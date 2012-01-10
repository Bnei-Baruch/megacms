module PagesHelper
  def get_widgets
    @page.get_placeholders.each do |placeholder|
      widgets = @page.widgets.by_placeholder(placeholder).all
      content_for placeholder.to_sym do
        widgets.map do|w|
          #begin
            content = render_cell w.cell_class, :display , :widget => w, :site => @site, :page => @page, :controller => @_controller
            management = "<div class=\"management\"><a href=\"#edit\">edit</a>&nbsp;<a href=\"#delete\">delete</a></div>".html_safe
            concat(content_tag :li, management + content, :class => 'widget-wrap', :'data-id' => "widget_#{w.id}")
          #rescue
          #  concat(content_tag :li, management, :class => 'widget-wrap', :'data-id' => "widget_#{w.id}")
          #end
        end
      end
    end
  end

  # Render placeholder (with widgets if exist)
  # @param type [:page, :theme] Layout for this page only or for every pages that use this theme
  # @param name [symbol] Name (id) for placeholder
  def placeholder(type, name)
    content = content_for name
    if current_user
      content = "<li class='h-title'>#{name}</li>#{content}".html_safe
    end
    content_tag :ul, content, :id => name, :class => "unstyled placeholder_#{type.to_s}", :style => 'min-height: 100px;'
  end

  def request_admin_bar_4_pages(page)
    content_for :admin_bar_4_pages do
      javascript_tag do
        <<-JS
        $(document).ready(function() {
          $.get('#{frontend_admin_admin_bar_path(page)}', function(data){
            $('body').prepend(data);
          })
        });
        JS
      end
    end
  end
end
