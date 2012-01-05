class RenameAssetsToContentAssets < ActiveRecord::Migration
  def up
    rename_table :assets, :content_assets
    rename_column :used_assets, :asset_id, :content_asset_id
  end

  def down
    rename_table :content_assets, :assets
    rename_column :used_assets, :content_asset_id, :asset_id
  end
end
