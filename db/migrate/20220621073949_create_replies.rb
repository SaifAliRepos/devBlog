# frozen_string_literal: true

# for creating replies on comment and suggestion
class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.references :replyable, polymorphic: true
      t.string :reply, null: false
      # t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
