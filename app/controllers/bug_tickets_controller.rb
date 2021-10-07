# frozen_string_literal: true

class BugTicketsController < ApplicationController
  before_action :set_bug_ticket, only: %i[show edit update destroy versions]
  before_action :authenticate_user!

  # GET /bug_tickets or /bug_tickets.json
  def index
    @bug_tickets = BugTicket.all
    @user_bug_tickets = BugTicket.where(owner: current_user.email)
    @support_bug_tickets = BugTicket.filter_by_support_user(current_user.id)
  end

  # GET /bug_tickets/1 or /bug_tickets/1.json
  def show
    @bug_tickets = @bug_ticket.versions
  end

  # GET /bug_tickets/new
  def new
    @bug_ticket = BugTicket.new

    @user = current_user

    @all_users_except_self = User.all.select { |u| u != current_user && u.role != 'user' }

    @bug_ticket_user = @bug_ticket.bug_ticket_users.build

    respond_to do |format|
      format.html
    end
  end

  # GET /bug_tickets/1/edit
  def edit
    @bug_ticket.owner = current_user.email
    @all_users_except_self = User.all.select { |u| u != current_user && u.role != 'user' }
  end

  # POST /bug_tickets or /bug_tickets.json
  def create
    @bug_ticket = BugTicket.new(bug_ticket_params)
    @bug_ticket.owner = current_user.email
    @all_users_except_self = User.all.select { |u| u != current_user && u.role != 'user' }
    if current_user.role != 'user' && current_user.role != 'support'
      params[:users][:id].each do |user|
        @bug_ticket.bug_ticket_users.build(user_id: user) unless user.empty?
      end
    end
    respond_to do |format|
      if @bug_ticket.save
        format.html { redirect_to bug_tickets_path, notice: 'Bug ticket was successfully created.' }
        format.json { render :show, status: :created, location: @bug_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bug_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bug_tickets/1 or /bug_tickets/1.json
  def update
    @bug_ticket.bug_ticket_users.clear
    @all_users_except_self = User.all.select { |u| u != current_user && u.role != 'user' }
    if current_user.role != 'user' && current_user.role != 'support'
      params[:users][:id].each do |user|
        @bug_ticket.bug_ticket_users.build(user_id: user) unless user.empty?
      end
    end
    respond_to do |format|
      if @bug_ticket.update(bug_ticket_params)
        format.html { redirect_to @bug_ticket, notice: 'Bug ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug_ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_tickets/1 or /bug_tickets/1.json
  def destroy
    @bug_ticket.destroy
    respond_to do |format|
      format.html { redirect_to bug_tickets_url, notice: 'Bug ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bug_ticket
    @bug_ticket = BugTicket.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bug_ticket_params
    params.require(:bug_ticket).permit(:bug_behavior, :environment, :status, :priority, :owner, :comment, :category, :main_image)
  end
end
