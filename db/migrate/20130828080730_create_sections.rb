class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :content
      t.boolean :checked

      t.timestamps
    end
  end
end
