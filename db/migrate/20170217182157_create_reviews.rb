class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user
      t.integer :product
      t.integer :rating
      t.text :description
      t.timestamps null: false
    end
  end
end
