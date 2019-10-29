class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender_id, :integer, :after => :user_name, default: 0
  end
end
