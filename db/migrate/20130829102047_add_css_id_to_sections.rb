## so section ++ css is pivots??????????


class AddCssIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :css_id, :integer
  end
end
