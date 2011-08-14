class RegisteredWidget < ActiveRecord::Base

###### --- associations + attributes ---

  has_many :widgets

  has_attached_file :image,
                    :url => "/files/registered_widgets/images/:id/:filename",
                    :path => ":rails_root/public/files/registered_widgets/images/:id/:filename"


###### --- validations ---

  validates_attachment_size :image, :less_than => 20.kilobytes
  #validates_attachment_presence :image


###### --- methods ---

  # for rails admin
  def name
    system_name
  end
end
