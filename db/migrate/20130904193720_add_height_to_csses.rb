class AddHeightToCsses < ActiveRecord::Migration
  def change
    add_column :csses, :height, :string
  end
end
