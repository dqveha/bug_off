# frozen_string_literal: true

class BugTicket < ApplicationRecord
  # include ActiveModel::Dirty
  belongs_to :project

  # has_many :bug_ticket_users, before_add: :set_btu_flag, after_remove: :set_btu_flag
  has_many :bug_ticket_users
  has_many :users, through: :bug_ticket_users

  # after_save :reset_btu


  has_one_attached :main_image

  validates :bug_behavior, presence: true, length: { in: 50..1250 }
  validates :environment, presence: true, length: { in: 50..1250 }
  validates :status, presence: true
  validates :priority, presence: true
  validates :owner, presence: true
  validates :project_id, presence: true
  validate :acceptable_image

  has_paper_trail on: %i[create update]

  scope :filter_by_support_user, ->(support_user_ids_arr) { joins(:users).where(users: { id: support_user_ids_arr }) }

  def acceptable_image
    return unless main_image.attached?

    errors.add(:main_image, 'is too big') unless main_image.byte_size <= 5.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:main_image, 'must be a JPEG or PNG') unless acceptable_types.include?(main_image.content_type)
  end

  # private
  #   def set_btu_flag
  #     @btu_changed = true
  #   end

  #   def reset_btu
  #     if @btu_changed || bug_ticket_users.any?(&:saved_changes?)
  #       params[:users][:id].each do |user|
  #         @bug_ticket.bug_ticket_users.build(user_id: user) unless user.empty?
  #       end
  #     end
  #   end
end
