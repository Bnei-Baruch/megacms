class Global::BlockCell < Global::WidgetCell

  def display(args = {})
    super
    render :layout => "widget"
  end

end
