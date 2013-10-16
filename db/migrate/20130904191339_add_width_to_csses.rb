class AddWidthToCsses < ActiveRecord::Migration
  def change
    add_column :csses, :width, :string
  end
end
