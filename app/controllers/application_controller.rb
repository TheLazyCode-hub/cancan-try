class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?

    private

    def set_paper_trail_whodunnit
      PaperTrail.request.whodunnit = current_user.id if current_user
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role_ids => []])
      devise_parameter_sanitizer.permit(:account_update, keys: [:role_ids => []])
    end
end
