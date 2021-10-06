# frozen_string_literal: true

class BugTicket < ApplicationRecord
  has_many :bug_ticket_users
  has_many :users, through: :bug_ticket_users

  has_one_attached :main_image

  validates :bug_behavior, presence: true, length: { in: 50..1250 }
  validates :environment, presence: true, length: { in: 50..1250 }
  validates :status, presence: true
  validates :priority, presence: true
  validates :owner, presence: true
  validate :acceptable_image

  has_paper_trail on: %i[create update]

  scope :filter_by_support_user, ->(support_user_ids_arr) { joins(:users).where(users: { id: support_user_ids_arr }) }

  def acceptable_image
    return unless main_image.attached?

    errors.add(:main_image, 'is too big') unless main_image.byte_size <= 5.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:main_image, 'must be a JPEG or PNG') unless acceptable_types.include?(main_image.content_type)
  end
end
