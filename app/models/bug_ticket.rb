class BugTicket < ApplicationRecord
  has_many :bug_ticket_users
  has_many :users, :through => :bug_ticket_users 

  has_one_attached :main_image

  validates :bug_behavior, presence: true, length: { in: 50..1250 }
  validates :environment, presence: true, length: { in: 50..1250 }
  validates :status, presence: true
  validates :priority, presence: true
  validates :owner, presence: true
  validate :acceptable_image

  has_paper_trail on: [:create, :update]

  scope :filter_by_support_user, -> (support_user_ids_arr) { joins(:users). where( users: { id: support_user_ids_arr})}

  def acceptable_image
    return unless main_image.attached?

    unless main_image.byte_size <= 5.megabyte
      errors.add(:main_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end
end
