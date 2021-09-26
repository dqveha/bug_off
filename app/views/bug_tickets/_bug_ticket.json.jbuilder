json.extract! bug_ticket, :id, :user_id, :bug_behavior, :environment, :status, :priority, :created_at, :updated_at
json.url bug_ticket_url(bug_ticket, format: :json)
