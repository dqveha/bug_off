class BugTicketUser < ApplicationRecord
  belongs_to :user
  belongs_to :bug_ticket

  has_paper_trail on: [:update]
end