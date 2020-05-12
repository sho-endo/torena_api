class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.references :part, null: false, foreign_key: true

      t.timestamps
    end

    add_index :menus, [:part_id, :name], unique: true
  end
end
