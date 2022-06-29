# frozen_string_literal: true

# creating posts on blog app
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name, null: false
      t.string :title
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
