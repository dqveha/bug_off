# frozen_string_literal: true

class AddBugTicketsAndHasManyThroughTable < ActiveRecord::Migration[6.1]
  def change
    create_table :bug_tickets do |t|
      t.text :bug_behavior, limit: 1250
      t.text :environment, limit: 1250
      t.string :status, default: 'open'
      t.string :priority
      t.timestamps
    end

    create_table :bug_ticket_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bug_ticket, index: true
      t.timestamps
    end
  end
end
