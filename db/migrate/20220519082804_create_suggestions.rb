# frozen_string_literal: true

# for creating suggestions on post
class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true
      t.string :find, null: false
      t.string :replace, null: false

      t.timestamps
    end
  end
end
