class Page < ActiveRecord::Base


###### --- rails admin ---
  rails_admin do
    list do
      include_fields :permalink, :title, :description
      field :image do
        pretty_value do
           "<img src='#{value.url(:thumb)}' style='max-height:80px;' />".html_safe
        end
      end
    end
  end


###### --- associations + attributes ---

  has_many :widgets
  belongs_to :site
  belongs_to :theme
  belongs_to :editor, :class_name => 'User'

  acts_as_tree :counter_cache => true, :order => :position

  has_attached_file :image,
                    :styles => {
                        :normal => {
                            :geometry => '280x>',
                            :quality => 70
                        },
                        :thumb => {
                            :geometry => '100x>',
                            :quality => 100,
                            :format => 'png'
                        }
                    },
                    :default_style => :normal,
                    :convert_options => {:all => "-strip -colorspace rgb"},
                    :url => "/files/pages/images/:id/:filename",
                    :path => ":rails_root/public/files/pages/images/:id/:filename"


  # handling delete in your model, if needed.
  attr_accessor :delete_image


###### --- scopes ---

  scope :site, Proc.new {|site_id| where(:site_id => site_id) }

  # State
  scope :draft, where(:status => 'DRAFT')
  scope :published, where(:status => 'PUBLISHED')
  scope :deleted, where(:status => 'DELETED')

  scope :in_navigation, where(:in_navigation => true)


###### --- validations ---

  validates_attachment_size :image, :less_than => 1.megabytes
#validates_attachment_presence :image
  validates :permalink, :uniqueness => true, :presence => true
  validates :title, :presence => true


###### --- callbacks ---

  before_save { self.image = nil if self.delete_image == '1' }


###### --- methods ---

  def get_theme
    theme || site.theme
  end

  # @return Array
  def get_placeholders
    get_theme.placeholders.split(',')
  end

  def to_param
    permalink
  end
end
