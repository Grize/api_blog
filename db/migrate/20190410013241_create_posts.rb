class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string     :title
      t.text       :body
      t.string     :username
      t.string     :user_ip
      t.float      :total_rating, default: 0
      t.integer    :rating_count, default: 0

      t.timestamps
    end
    add_index :posts, :user_ip
    add_index :posts, :username
  end
end
