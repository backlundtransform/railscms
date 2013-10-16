class AddCheckedToLayouts < ActiveRecord::Migration
  def change
    add_column :layouts, :checked, :boolean
  end
end
