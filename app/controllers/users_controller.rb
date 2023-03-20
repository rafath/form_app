# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(email: user_params[:email]) do |user|
      user.name = user_params[:name]
    end

    unless !form_validator.invalid? && @user.valid?
      form_validator.errors_for(@user)
      render(:index, status: :unprocessable_entity) and return
    end

    @user.save and redirect_to thank_you_users_path
  end

  private

  def permitted_parameters
    params.permit(:authenticity_token, :commit, user: %i[email name])
  end

  def form_validator
    @form_validator ||= FormValidator.new(UserForm, user_params)
  end

  def user_params
    permitted_parameters[:user] || {}
  end
end
