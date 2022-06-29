# frozen_string_literal: true

# Likes on post and comments
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      # t.references :post, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.references :likeable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
