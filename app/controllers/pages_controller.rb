class PagesController < ApplicationController
  layout :get_layout

  def show

  end

  private

  def get_layout
    @page.get_theme.try(:system_name) || "application"
  end

end
