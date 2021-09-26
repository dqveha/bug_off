class CreateForms < ActiveRecord::Migration[6.1]
  def change
    create_table :forms do |t|
      t.references :user, null: true, foreign_key: true
      t.text :bug_behavior, limit: 1250
      t.text :environment, limit: 1250
      t.string :status, default: "open"
      t.string :priority

      t.timestamps
    end
  end
end
