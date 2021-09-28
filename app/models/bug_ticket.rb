class BugTicket < ApplicationRecord
  has_many :bug_ticket_users
  has_many :users, :through => :bug_ticket_users 
end
