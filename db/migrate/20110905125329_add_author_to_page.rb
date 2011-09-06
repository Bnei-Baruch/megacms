class AddAuthorToPage < ActiveRecord::Migration
  def change
    add_column :pages, :editor_id, :integer
  end
end
