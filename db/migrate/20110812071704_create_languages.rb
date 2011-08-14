class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :system_name
      t.string :locale
      t.string :local_name

      t.timestamps
    end
  end
end
