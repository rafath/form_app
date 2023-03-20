# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  config.messages.default_locale = :pl
  config.messages.load_paths << 'config/locales/dry_validation.pl.yml'
end
