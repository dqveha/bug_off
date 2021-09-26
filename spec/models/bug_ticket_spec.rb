require 'rails_helper'

describe BugTicket do

  it { should have_many(:users).through(:bug_ticket_users) }

end