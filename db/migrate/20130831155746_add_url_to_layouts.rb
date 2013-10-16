class AddUrlToLayouts < ActiveRecord::Migration
  def change
    add_column :layouts, :url, :string
  end
end
