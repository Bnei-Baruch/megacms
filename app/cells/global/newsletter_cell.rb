class Global::NewsletterCell < Global::WidgetCell

  def display(args = {})
    super
    render :layout => "widget"
  end

end
