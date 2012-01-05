class ContentAsset < ActiveRecord::Base
###### --- associations + attributes ---
  belongs_to :resource, :polymorphic => true
  belongs_to :site
  has_many :used_assets
  has_many :widgets, :through => :used_assets
###### --- validations ---
###### --- scopes ---
end
