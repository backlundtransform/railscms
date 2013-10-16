class RemoveUrlFromLayouts < ActiveRecord::Migration
  def change
    remove_column :layouts, :url, :string
  end
end
