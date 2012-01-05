class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.text :body
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :author
      t.integer :source_id
      t.datetime :publication_date

      t.timestamps
    end
  end
end
