class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :food_item, index: true, foreign_key: true
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
