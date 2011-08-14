class PagesController < ApplicationController
  layout :get_layout

  before_filter :set_locale
  def show

  end


  def get_layout
    @page.get_theme.try(:system_name) || "application"
  end

  def set_locale
    @site = Site.find_by_domain(URI.parse(request.url).host)
    @page = @site.pages.find_by_permalink(params[:id])
    I18n.locale = @locale = @site.language.locale
  end

end
