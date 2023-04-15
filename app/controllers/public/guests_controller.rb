class Public::GuestsController < ApplicationController

  # def guest_sign_in
  #   user = User.find_or_create_by!(name: "ゲストユーザー", email: "guests@example.com", is_deleted: false) do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #   end
  #   sign_in user
  #   redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  # end
  def guest_sign_in
    random_value = SecureRandom.hex
    user = User.create!(name: "ゲストユーザー", email: "test_#{random_value}@example.com", password: "#{random_value}", password_confirmation: "#{random_value}")
    sign_in user
    redirect_to  root_path, notice: 'ゲストユーザーとしてログインしました'
  end


end
