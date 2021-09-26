class AddBugTicketsAndHasManyThroughTable < ActiveRecord::Migration[6.1]
  def change
    create_table :bug_tickets do |t|
      t.text :bug_behavior, limit: 1250
      t.text :environment, limit: 1250
      t.string :status, default: "open"
      t.string :priority
      t.timestamps
    end

    create_table :bug_tickets_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bug_tickets, index: true
    end
  end
end
