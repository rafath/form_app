# frozen_string_literal: true

class FormValidator
  def initialize(contract, attributes, **options)
    @contract   = contract.send(:new, **options)
    @attributes = attributes.to_hash
  end

  def invalid?
    errors.present?
  end

  def errors_for(model)
    model.valid? if model.errors.blank?
    model.errors.merge!(DryErrorsAdapter.new(errors))
  end

  private

  attr_reader :contract, :attributes

  def errors
    contract.call(attributes).errors
  end
end
