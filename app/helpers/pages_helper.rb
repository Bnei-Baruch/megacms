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
  # @param block [] Possible block to be evaluated <em>Before</em> widgets
  def placeholder(type, name, &block)
    content = content_for(name)
    content = "<li class='h-title'>#{name}</li>#{content}".html_safe if current_user

    capture_haml do
      haml_tag :ul, {:id => name, :class => "unstyled placeholder_#{type.to_s}", :style => 'min-height: 100px;'} do
        haml_concat capture_haml(&block) if block_given?
        haml_concat content
      end
    end
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
