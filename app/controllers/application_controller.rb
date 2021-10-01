class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    # logged_in? ({:email => current_user.email, :role => current_user.role}) : 'Public user'
    current_user? current_user.email : 'Public user'
  end
end
