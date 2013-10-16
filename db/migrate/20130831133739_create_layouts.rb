class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.string :title

      t.timestamps
    end
  end
end
