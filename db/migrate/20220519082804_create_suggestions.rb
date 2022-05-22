class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.belongs_to :post, foreign_key: true
      t.string :find
      t.string :replace

      t.timestamps
    end
  end
end
