class BugTicketUser < ApplicationRecord
  belongs_to :user
  belongs_to :bug_ticket
end