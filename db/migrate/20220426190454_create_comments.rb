class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, foreign_key: true
      #t.references :parent, foreign_key: { to_table: :comments }
      t.string :cmnt, null: false

      t.timestamps
    end
  end
end
