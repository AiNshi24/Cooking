class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :guest_sign_in]
end
