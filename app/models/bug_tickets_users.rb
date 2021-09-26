class BugTicketsUsers < ApplicationRecord
  belongs_to :user
  belongs_to :bug_tickets
end