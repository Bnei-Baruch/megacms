class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :source_url

      t.timestamps
    end
  end
end
