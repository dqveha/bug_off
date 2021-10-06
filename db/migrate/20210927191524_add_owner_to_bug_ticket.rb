# frozen_string_literal: true

class AddOwnerToBugTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :bug_tickets, :owner, :string
  end
end
