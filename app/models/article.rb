class Article < ActiveRecord::Base
  belongs_to :source
  has_one :content_asset, :as => :resource


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
                    :url => "/files/articles/images/:id/:filename",
                    :path => ":rails_root/public/files/articles/images/:id/:filename"

###### --- rails admin ---
  rails_admin do
    edit do
      include_fields :title, :subtitle, :description, :author, :publication_date, :image, :source
      field :body do
        ckeditor true
      end
      #include_all_fields
    end
  end

end
