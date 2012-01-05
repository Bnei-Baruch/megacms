class UsedAsset < ActiveRecord::Base
###### --- associations + attributes ---
  belongs_to :widget
  belongs_to :content_asset
end
