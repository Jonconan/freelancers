class CreateFrameworks < ActiveRecord::Migration[5.2]
  def change
    create_table :frameworks do |t|
      t.integer :region_id, null: false
      t.string  :name, null: false
      t.boolean :del_flg, null: false, default: false

      t.timestamps
    end
  end
end
