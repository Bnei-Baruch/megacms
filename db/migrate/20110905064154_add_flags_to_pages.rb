class AddFlagsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :in_navigation, :boolean, :default => false, :null => false
    # DRAFT / PUBLISHED / DELETED
    add_column :pages, :state, :string, :default => "DRAFT", :null => false
  end
end
