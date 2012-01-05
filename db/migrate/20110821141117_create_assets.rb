class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :status
      t.references :resource, :polymorphic => true
      t.timestamps
    end
    add_index :assets, :status
  end
end
