class Language < ActiveRecord::Base
  has_many :sites


  def name
    self.system_name
  end
end
