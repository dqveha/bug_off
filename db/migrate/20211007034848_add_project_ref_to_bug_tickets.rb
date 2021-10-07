class AddProjectRefToBugTickets < ActiveRecord::Migration[6.1]
  def change
    add_reference :bug_tickets, :project, foreign_key: true
  end
end
