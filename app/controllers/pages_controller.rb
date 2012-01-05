class PagesController < ApplicationController
  layout :get_layout

  def show

  end

  private

  def get_layout
    @page.try(:get_theme).try(:system_name) || "application"
  end

end
