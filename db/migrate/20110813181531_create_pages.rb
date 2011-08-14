class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :permalink
      t.string :title
      t.text :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :site_id
      t.integer :theme_id
      t.integer :parent_id
      t.string :placeholder
      t.integer :position

      t.timestamps
    end
  end
end
