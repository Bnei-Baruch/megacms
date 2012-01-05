class Global::ArticleCell < Global::WidgetCell

  def display(args = {})
    super
    @article = @widget.content_assets.try(:first).try(:resource)
    render :layout => "widget"
  end

  def edit(args = {})
    super
    @article = @widget.content_assets.try(:first).try(:resource) || Article.new
    render :layout => nil
  end

  def update
    article_id = params[:article][:id].present? ? params[:article][:id] : nil

    if article_id # Edit mode
      @article = Article.find(article_id)
      if @article.update_attributes(params[:article])
        true
      else
        render :edit, :layout => nil
      end
    else # Create mode
      @article = Article.new(params[:article])
      @content_asset = ContentAsset.new(:site_id => @site.id)
      @content_asset.resource = @article
      if @article.save
        @widget.content_assets << @content_asset
        true
      else
        render :edit, :layout => nil
      end
    end
  end

  def destroy
    kuku = 1
  end

end
