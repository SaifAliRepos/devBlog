# frozen_string_literal: true

# creating posts on blog app
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name, null: false
      t.string :title
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
