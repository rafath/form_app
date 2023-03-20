# frozen_string_literal: true

class DryErrorsAdapter
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  attr_reader :dry_errors, :errors

  def initialize(dry_errors)
    @errors = ActiveModel::Errors.new(self)
    @dry_errors = dry_errors
    validate!
  end

  def validate!
    dry_errors.each do |dry_error|
      errors.add(dry_error.path.first, message: dry_error.text)
    end
  end

  def method_missing(symbol, *_args)
    symbol
  end

  def read_attribute_for_validation(attr)
    send(attr)
  end

  def self.human_attribute_name(attr, _options = {})
    attr
  end

  def self.lookup_ancestors
    [self]
  end
end
