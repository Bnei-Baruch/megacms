class Site < ActiveRecord::Base

  belongs_to :language
  belongs_to :theme
  has_many :pages do
    def root_page
      where(:parent_id => nil).first
    end
  end
  belongs_to :default_page, :class_name => 'Page', :foreign_key => :default_page_id
  has_many :content_assets

  validates :theme_id, :presence => true
  validates :default_page_id, :presence => true


  # for rails admin
  def name
    system_name
  end

end
