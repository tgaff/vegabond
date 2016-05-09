class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :born_city
      t.string :current_city
      t.string :favorite_destination
      t.string :bio
      t.string :fav_travel_story
      t.string :password_digest
      t.string :email

      t.timestamps null: false
    end
  end
end
