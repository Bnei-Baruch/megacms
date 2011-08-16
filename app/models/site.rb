class Site < ActiveRecord::Base

  belongs_to :language
  belongs_to :theme
  has_many :pages
  belongs_to :default_page, :class_name => 'Page', :foreign_key => :default_page_id

  validates :theme_id, :presence => true
  validates :default_page_id, :presence => true


  # for rails admin
  def name
    system_name
  end

end
