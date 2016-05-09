class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :city
      t.string :story
      t.string :image

      t.timestamps null: false
    end
  end
end
