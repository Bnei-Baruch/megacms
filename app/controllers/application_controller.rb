class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :test1

  def test1
    a = 3
  end

end
