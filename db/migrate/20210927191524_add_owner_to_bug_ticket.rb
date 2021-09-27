class AddOwnerToBugTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :bug_tickets, :owner, :string
  end
end
