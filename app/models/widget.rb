class Widget < ActiveRecord::Base

###### --- associations + attributes ---

  belongs_to :page
  belongs_to :registered_widget

  has_many :used_assets, :dependent => :destroy
  has_many :content_assets, :through => :used_assets

  delegate :system_name, :to  => :registered_widget
  delegate :site, :to  => :page

###### --- validations ---

  validates :registered_widget_id, :presence => true

###### --- scopes ---
  scope :by_placeholder, lambda {|placeholder| where('placeholder = ?', placeholder).ordered }
  scope :ordered, order(:position)


  def cell_class
    eval("#{site.system_name}/#{system_name}".camelize).constantize
  rescue
    "global/#{system_name}".camelize.constantize
  end
end
