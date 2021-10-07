class AddProjectRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :project, foreign_key: true
  end
end
