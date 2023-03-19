class Public::GuestsController < ApplicationController

  def guest_sign_in
    user = User.find_or_create_by!(name: "ゲスト", email: "guest@example.com", is_deleted: false) do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.password_confirmation = user.password
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

end
