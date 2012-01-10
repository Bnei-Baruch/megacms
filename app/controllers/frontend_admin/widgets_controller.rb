class FrontendAdmin::WidgetsController < ApplicationController
  layout false

  #def new
  #  owner = :page_id
  #  @widget = Widget.new(:registered_widget_id => 'article', owner => 1)
  #
  #end

  # create new instance
  def create
    @placeholder = params[:placeholder]
    @page_id = params[:page_id]
    @reg_id = params[:reg_id]

    # dropped from list of registered widgets
    @widget = Widget.create(:page_id => @page_id, :placeholder => @placeholder, :registered_widget_id => @reg_id, :position => 0)
  end

  def edit
    widget = Widget.find params[:id]
    widget_type = widget.cell_class

    @cell_opts = {:widget_options => {:widget => widget, :site => @site, :page => @page, :controller => self}, :state => :edit, :widget_type => widget_type}
    render :layout => 'admin'
  end

  def update
    widget = Widget.find params[:id]
    widget_type = widget.cell_class
    cell = render_cell widget_type, :update, :widget => widget, :site => @site, :page => widget.page
    if cell == true
      redirect_to page_path(widget.page)
    else
      render :text => cell
    end
  end

  # update placeholder
  def update_placeholder
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

  def destroy
    kuku = 1
  end

end
