class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :name, null: false
      t.boolean :del_flg, null: false, default: false

      t.timestamps
    end
  end
end
