class Global::WidgetCell < Cell::Rails
  include Devise::Controllers::Helpers
  helper_method :current_user

  def edit(args = {})
    set_args(args)
  end

  def display(args = {})
    set_args(args)
  end


  def set_args(args = {})
    @widget = args[:widget]
    @controller = args[:controller]
    @page = args[:page]
    @site = args[:site]
  end

  def request
    @controller.request
  end

end
