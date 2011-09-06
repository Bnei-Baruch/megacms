class AddCountToPages < ActiveRecord::Migration
  def change
    add_column :pages, :pages_count, :integer, :default => 0
  end
end
