class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :title
      t.text :meta_description
      t.integer :site_id

      t.timestamps

    end
  end
  
  def down
    drop_table :pages
  end
end
