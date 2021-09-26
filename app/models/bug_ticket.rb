class BugTicket < ApplicationRecord
  has_many :bug_tickets_users
  has_many :users, :through => :bug_tickets_users 
end
