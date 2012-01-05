class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  #private

  def set_locale
    return if env['rack.mount.prefix'] == '/admin' #otherwise it will show untranslated hebrew interface for rails admin
    @site = Site.find_by_domain(URI.parse(request.url).host)
    return unless @site
    @page = @site.pages.find_by_permalink(params[:id])
    I18n.locale = @locale = @site.language.locale
  end

end
