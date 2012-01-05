class AddImageFileNameToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_file_name, :string
  end
end
