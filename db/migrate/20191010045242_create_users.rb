class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name, null: false
      t.string  :user_code, null: false
      t.string  :user_name, null: false
      t.string  :email, null: false
      t.string  :crypted_password, null: false
      t.string  :salt, null: false
      t.string  :profile_image_path
      t.integer :prefecture_id, null: false
      t.string  :area
      t.date    :birthday, null: false
      t.integer :display_type, null: false, default: 0
      t.integer :status_id, null: false, default: 0
      t.string  :twitter_id
      t.string  :facebook_id
      t.string  :github_id
      t.string  :youtube_id
      t.string  :website_url
      t.boolean :del_flg, null: false, default: false

      t.timestamps
    end
  end
end
