# frozen_string_literal: true

require 'rails_helper'

describe BugTicketUser do
  it { should belong_to(:bug_ticket) }
  it { should belong_to(:user) }
end
