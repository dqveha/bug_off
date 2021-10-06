# frozen_string_literal: true

class BugTicketUser < ApplicationRecord
  belongs_to :user
  belongs_to :bug_ticket

  has_paper_trail on: %i[create update]
end
