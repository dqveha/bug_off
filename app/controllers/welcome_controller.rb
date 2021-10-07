# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def home
    open_tickets = BugTicket.where.not(status: "closed").group(:priority).count
    open_category = BugTicket.where.not(status: "closed").group(:category).count
    open_support_tickets = BugTicket.filter_by_support_user(current_user.id).where.not(status: "closed").group(:priority).count

    closed_tickets = BugTicket.where(status: "closed").group(:priority).count
    closed_category = BugTicket.where(status: "closed").group(:category).count
    closed_support_tickets = BugTicket.filter_by_support_user(current_user.id).where(status: "closed").group(:priority).count

    @piechart_open = open_tickets.transform_keys{ |k| k.to_s.humanize.titleize }
    @barchart_open = open_category.transform_keys{ |k| k.to_s.humanize.titleize }
    @barchart_support_open = open_support_tickets.transform_keys{ |k| k.to_s.humanize.titleize }

    @piechart_closed = closed_tickets.transform_keys{ |k| k.to_s.humanize.titleize }
    @barchart_closed = closed_category.transform_keys{ |k| k.to_s.humanize.titleize }
    @barchart_support_closed = closed_support_tickets.transform_keys{ |k| k.to_s.humanize.titleize }

  end
end
