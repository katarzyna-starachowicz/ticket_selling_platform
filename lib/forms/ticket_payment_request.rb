# frozen_string_literal: true

module Forms
  class TicketPaymentRequest < ::Dry::Validation::Contract
    params do
      required(:event_id).filled(:integer)
      required(:payment_token).filled(:string)
      required(:user_email).filled(:string)
    end

    rule(:user_email) do
      unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
        key.failure('has invalid format')
      end
    end
  end
end
