class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :system_name
      t.integer :page_id
      t.string :placeholder
      t.integer :position
      t.integer :registered_widget_id

      t.timestamps
    end
  end
end
