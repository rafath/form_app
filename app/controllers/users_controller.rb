# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def create
    # @user = User.new(user_params)
    @user = User.find_or_initialize_by(email: user_params[:email]) do |user|
      user.name = user_params[:name]
    end

    unless !form_validator.invalid? && @user.valid?
      form_validator.errors_for(@user)
      # binding.pry
      render(:index, status: :unprocessable_entity) and return
    end

    # unless !form_validator.invalid? && @user.valid?
    #   form_validator.errors_for(@user)
    #   render template: 'users/index' and return
    # end

    @user.save and redirect_to thank_you_users_path
  end

  def thank_you

  end

  private

  def permitted_parameters
    params.permit(:authenticity_token, :commit, user: [:email, :name])
  end


  def form_validator
    @form_validator ||= FormValidator.new(UserForm, user_params)
  end

  def user_params
    permitted_parameters[:user] || {}
  end
end
