class AddCategoryToBugTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :bug_tickets, :category, :string
  end
end
