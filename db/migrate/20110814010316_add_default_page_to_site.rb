class AddDefaultPageToSite < ActiveRecord::Migration
  def change
    add_column :sites, :default_page_id, :integer
  end
end
