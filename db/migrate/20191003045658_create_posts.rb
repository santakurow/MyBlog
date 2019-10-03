class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :text, null: false
      t.references :user_id, forein_key: true
      t.timestamps
    end
  end
end
