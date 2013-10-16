class CreateCsses < ActiveRecord::Migration
  def change
    create_table :csses do |t|
      t.string :color
      t.string :background

      t.timestamps
    end
  end
end
