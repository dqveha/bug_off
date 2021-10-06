# frozen_string_literal: true

require 'rails_helper'

describe User do
  it { should have_many(:bug_tickets).through(:bug_ticket_users) }
end
