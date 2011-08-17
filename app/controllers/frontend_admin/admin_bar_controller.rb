class FrontendAdmin::AdminBarController < ApplicationController
  layout false

  def show
    @widgets = RegisteredWidget.all
  end

end
