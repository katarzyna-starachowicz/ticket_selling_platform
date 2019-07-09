# frozen_string_literal: true

module Forms
  class ChargeOrder < ::Dry::Validation::Contract
    params do
      required(:reserved_ticket).filled(:hash)
      required(:ticket_payment).filled(:hash)
    end
  end
end
