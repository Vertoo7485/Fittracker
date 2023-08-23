# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :name
      t.string :password_digest
      t.integer :weight
      t.integer :growth
      t.integer :years
      t.string :gender

      t.timestamps
    end
  end
end
