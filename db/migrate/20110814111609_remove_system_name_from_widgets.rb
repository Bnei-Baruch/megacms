class RemoveSystemNameFromWidgets < ActiveRecord::Migration
  def up
    remove_column :widgets, :system_name
  end

  def down
    add_column :widgets, :system_name, :string
  end
end
