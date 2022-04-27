class CreateLikecs < ActiveRecord::Migration[7.0]
  def change
    create_table :likecs do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
