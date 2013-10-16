## so section ++ css is pivots??????????

class AddSectionIdToCss < ActiveRecord::Migration
  def change
    add_column :csses, :section_id, :integer
  end
end
