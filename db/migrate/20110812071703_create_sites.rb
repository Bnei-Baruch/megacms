class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :system_name
      t.string :domain
      t.string :path_prefix
      t.integer :language_id
      t.integer :theme_id

      t.timestamps
    end
  end
end
