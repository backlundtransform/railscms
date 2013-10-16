class AddPageIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :page_id, :integer
  end
end
