class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :user_id
      t.string :title
      t.string :image
        
    t.string :second_title
      t.text :second_body
      t.text :second_link
        

      t.timestamps
    end
  end
end
