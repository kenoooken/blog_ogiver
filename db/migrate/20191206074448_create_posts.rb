class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
        #タイトル・メタタグ
      t.text :body
      t.integer :user_id
      t.string :title
      t.string :image
    
        #１つ目の見出し
    t.string :second_title
      t.text :second_body
      t.text :second_link
      t.string :second_image
    
        #２つ目の見出し
    t.string :third_title
      t.text :third_body
      t.text :third_link
      t.string :third_image
    
        #３つ目の見出し
    t.string :fourth_title
      t.text :fourth_body
      t.text :fourth_li4nk
      t.string :fourth_image

        #４つ目の見出し
    t.string :fifth_title
      t.text :fifth_body
      t.text :fifth_link
      t.string :fifth_image
        
        #5つ目の見出し
    t.string :sixth_title
      t.text :sixth_body
      t.text :sixth_link
      t.string :sixth_image
        
      t.timestamps
    end
  end
end
