class CreateUsedAssets < ActiveRecord::Migration
  def change
    create_table :used_assets do |t|
      t.integer :widget_id
      t.integer :asset_id
      t.integer :position

      t.timestamps
    end
  end
end
