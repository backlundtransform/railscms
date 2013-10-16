class AddSiteIdToSection < ActiveRecord::Migration
  def change
    add_column :sections, :site_id, :integer
  end
end
