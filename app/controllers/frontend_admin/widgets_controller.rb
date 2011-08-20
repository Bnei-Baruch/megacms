class FrontendAdmin::WidgetsController < ApplicationController
  layout false

  # @todo create new instance
  # @todo update data-id of parent li
  def create
    placeholder = params[:placeholder]
    page_id = params[:page_id]
    id = params[:id]

    if (params[:func] == 'remove')
      # Was moved to another placeholder
    elsif (params[:func] == 'new')
      # dropped from list of registered widgets
      rw = RegisteredWidget.find(id)
      w = Widget.create(:page_id => page_id, :placeholder => placeholder, :registered_widget_id => id, :position => 0)
      content = render_cell(rw.system_name.to_sym, :display).gsub(/\n/, '')
      management = "<div class=\"management\"><a href=\"#edit\">edit</a>&nbsp;<a href=\"#delete\">delete</a></div>".html_safe
      render :js=> "$('##{placeholder} li[data-id=registered_widget_#{id}]').html('#{management +
          content}').attr('data-id', 'widget_#{w.id}').addClass('widget-wrap');"
    else
      # receive - dropped from another placeholder
    end

  end

  def sort
    render :js => 'alert("OK");'
  end
end
