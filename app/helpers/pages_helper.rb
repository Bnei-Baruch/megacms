module PagesHelper
  def get_widgets
    @page.get_placeholders.each do |placeholder|
      widgets = @page.widgets.by_placeholder(placeholder).all
      content_for placeholder.to_sym do
        widgets.map do|w|
          render_cell w.system_name.to_sym, :display
        end.join
      end
    end
  end
end
