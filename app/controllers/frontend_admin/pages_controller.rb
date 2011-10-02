class FrontendAdmin::PagesController < ApplicationController

  layout 'frontend_admin'

  def index

  end

  def new
    @parent = Page.find(params[:parent_id])
    @page = Page.new(:parent_id => @parent.id,
                     :editor_id => current_user.id,
                     :site_id => @site.id
    )
  end

  def create
    @parent = Page.find(params[:page][:parent_id])
    @page = Page.new(params[:page])
    if @page.save
      redirect_to :action => :index, :notice => "Successfully created page #{@page.title}"
    else
      render :action => :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find_by_permalink(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to :action => :index, :notice => "Successfully updated page #{@page.title}"
    else
      render :action => :edit
    end
  end

  def destroy
    # remove node's children
    # remove widgets
    # mark node as destroyed
    # clear its parent
    # for parent: re-enumerate positions
    render :js => 'alert("no, not really...")', :status => 200
  end

  def get_children
    if params[:parent_id] == "0"
      # return the root node
      @pages = [@site.pages.root_page]
      @is_moveable = false
    else
      parent = Page.find(params[:parent_id])
      @pages = parent.children
      @is_moveable = true
    end

    render :layout => false
  end

  def node_change
    if params[:is_copy] == 1
      # ...
    end
    node = Page.find(params[:node])
    source = Page.find(params[:source])
    target = Page.find(params[:target])
    # transfer node from original parent to a new one
    node.parent = target
    node.save
    # re-enumerate the remaining nodes of the original parent
    source.children.each_with_index { |n, idx|
      n.update_attribute(:position, idx)
    }
    # re-enumerate the new parent
    pos_to = params[:pos_to].to_i
    target.children.each_with_index { |n, idx|
      next if n.position < pos_to
      n.update_attribute(:position, idx + 1)
    }
    node.update_attribute(:position, pos_to)

    render :js => 'alert("OK");'
  end

  def set_navigation_status
    page = Page.find(params[:page_id])
    page.update_attribute :in_navigation, params[:is_checked]
    render :js => ''
  end

  def set_published_status
    page = Page.find(params[:page_id])
    page.update_attribute :state, params[:is_checked] ? 'PUBLISHED' : 'DRAFT'
    render :js => ''
  end

  def set_homepage_status
    page = Page.find(params[:page_id])
    unless page == @site.default_page
      @site.default_page = page
      @site.save
    end
    render :js => ';', :status => 200
  end

end
