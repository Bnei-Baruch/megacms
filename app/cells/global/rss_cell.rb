class Global::RssCell < Global::WidgetCell

  def display(args = {})
    super
    render :layout => "widget"
  end

end
