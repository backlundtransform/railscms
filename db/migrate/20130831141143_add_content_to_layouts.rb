class AddContentToLayouts < ActiveRecord::Migration
  def change
    add_column :layouts, :content, :string
  end
end
