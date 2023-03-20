# frozen_string_literal: true

class UserForm < ApplicationContract
  include ActiveModel::Model

  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  params do
    required(:email).filled(:string)
    required(:name).filled(:string)
  end

  rule(:email) do
    key.failure(:missing_at) unless value.include?('@')
    key.failure(:invalid_format) unless EMAIL_REGEXP.match?(value)
  end
end
