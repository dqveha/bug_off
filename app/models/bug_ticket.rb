class BugTicket < ApplicationRecord
  has_many :bug_ticket_users
  has_many :users, :through => :bug_ticket_users 

  validates :bug_behavior, presence: true, length: { in: 50..1250 }
  validates :environment, presence: true, length: { in: 50..1250 }
  validates :status, presence: true
  validates :priority, presence: true
  validates :owner, presence: true

  has_paper_trail on: [:create, :update]

  scope :filter_by_support_user, -> (support_user_ids_arr) { joins(:users). where( users: { id: support_user_ids_arr})}
end
