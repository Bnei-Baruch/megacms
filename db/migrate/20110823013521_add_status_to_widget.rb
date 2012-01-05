class AddStatusToWidget < ActiveRecord::Migration
  def up
    add_column :widgets, :status, :string
    add_index :widgets, :status
  end

  def down
    remove_column :widgets, :status
    remove_index :widgets, :status
  end
end
