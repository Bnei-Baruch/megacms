class FrontendAdmin::WidgetsController < ApplicationController
  layout false

  # create new instance
  def create
    placeholder = params[:placeholder]
    page_id = params[:page_id]
    reg_id = params[:reg_id]

    # dropped from list of registered widgets
    rw = RegisteredWidget.find(reg_id)
    w = Widget.create(:page_id => page_id, :placeholder => placeholder, :registered_widget_id => reg_id, :position => 0)
    content = render_cell(rw.system_name.to_sym, :display, :widget => w).gsub(/\n/, '')
    management = "<div class=\"management\"><a href=\"#edit\">edit</a>&nbsp;<a href=\"#delete\">delete</a></div>".html_safe
    render :js=> "$('##{placeholder} li[data-id=registered_widget_#{reg_id}]').html('#{management +
        content}').attr('data-id', 'widget_#{w.id}').addClass('widget-wrap');console.info('created');"
  end

  # update placeholder
  def update
    placeholder = params[:placeholder] # new placeholder
    page_id = params[:page_id]
    id = params[:id]

    widget = Widget.find(id)
    if widget.update_attribute(:placeholder, placeholder)
      render :js => 'console.info("moved");'
    else
      render :nothing => true, :status => 400
    end
  end

  # reorder existing items
  def sort
    order = params[:widget]

    status = 200
    Widget.transaction do
      begin
        order.each_with_index { |id, idx|
          widget = Widget.find(id)
          widget.update_attribute(:position, idx)
        }
      rescue
        status = 400
      end
    end

    render :nothing => true, :status => status
  end

end
