class RemovePageIdFromSection < ActiveRecord::Migration
  def change
    remove_column :sections, :page_id, :integer
  end
end
