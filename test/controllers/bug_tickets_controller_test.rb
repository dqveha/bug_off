require "test_helper"

class BugTicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bug_ticket = bug_tickets(:one)
  end

  test "should get index" do
    get bug_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_bug_ticket_url
    assert_response :success
  end

  test "should create bug_ticket" do
    assert_difference('BugTicket.count') do
      post bug_tickets_url, params: { bug_ticket: { bug_behavior: @bug_ticket.bug_behavior, environment: @bug_ticket.environment, priority: @bug_ticket.priority, status: @bug_ticket.status, user_id: @bug_ticket.user_id } }
    end

    assert_redirected_to bug_ticket_url(BugTicket.last)
  end

  test "should show bug_ticket" do
    get bug_ticket_url(@bug_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_bug_ticket_url(@bug_ticket)
    assert_response :success
  end

  test "should update bug_ticket" do
    patch bug_ticket_url(@bug_ticket), params: { bug_ticket: { bug_behavior: @bug_ticket.bug_behavior, environment: @bug_ticket.environment, priority: @bug_ticket.priority, status: @bug_ticket.status, user_id: @bug_ticket.user_id } }
    assert_redirected_to bug_ticket_url(@bug_ticket)
  end

  test "should destroy bug_ticket" do
    assert_difference('BugTicket.count', -1) do
      delete bug_ticket_url(@bug_ticket)
    end

    assert_redirected_to bug_tickets_url
  end
end
