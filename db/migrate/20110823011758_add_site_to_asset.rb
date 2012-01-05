class AddSiteToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :site_id, :integer
  end
end
