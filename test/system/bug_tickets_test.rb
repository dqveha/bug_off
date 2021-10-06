# frozen_string_literal: true

require 'application_system_test_case'

class BugTicketsTest < ApplicationSystemTestCase
  setup do
    @bug_ticket = bug_tickets(:one)
  end

  test 'visiting the index' do
    visit bug_tickets_url
    assert_selector 'h1', text: 'Bug Tickets'
  end

  test 'creating a Bug ticket' do
    visit bug_tickets_url
    click_on 'New Bug Ticket'

    fill_in 'Bug behavior', with: @bug_ticket.bug_behavior
    fill_in 'Environment', with: @bug_ticket.environment
    fill_in 'Priority', with: @bug_ticket.priority
    fill_in 'Status', with: @bug_ticket.status
    fill_in 'User', with: @bug_ticket.user_id
    click_on 'Create Bug ticket'

    assert_text 'Bug ticket was successfully created'
    click_on 'Back'
  end

  test 'updating a Bug ticket' do
    visit bug_tickets_url
    click_on 'Edit', match: :first

    fill_in 'Bug behavior', with: @bug_ticket.bug_behavior
    fill_in 'Environment', with: @bug_ticket.environment
    fill_in 'Priority', with: @bug_ticket.priority
    fill_in 'Status', with: @bug_ticket.status
    fill_in 'User', with: @bug_ticket.user_id
    click_on 'Update Bug ticket'

    assert_text 'Bug ticket was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Bug ticket' do
    visit bug_tickets_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Bug ticket was successfully destroyed'
  end
end
