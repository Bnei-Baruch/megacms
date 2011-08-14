class Theme < ActiveRecord::Base

###### --- associations + attributes ---

  has_many :sites

  has_attached_file :image,
                    :styles => {:thumb => {
                        :geometry => '100x>',
                        :quality => 100,
                        :format => 'png'
                    }},
                    :default_style => :thumb,
                    :convert_options => {:all => "-strip -colorspace rgb"},
                    :url => "/files/themes/images/:id/:filename",
                    :path => ":rails_root/public/files/themes/images/:id/:filename"

  # handling delete in your model, if needed.
  attr_accessor :delete_image


###### --- validations ---

  validates :system_name, :presence => true
  validates_attachment_size :image, :less_than => 500.kilobytes


###### --- callbacks ---

  before_save { self.image = nil if self.delete_image == '1' }


###### --- methods ---

# for rails admin
  def name
    system_name
  end
end
