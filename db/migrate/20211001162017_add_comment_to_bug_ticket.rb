class AddCommentToBugTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :bug_tickets, :comment, :text
  end
end
