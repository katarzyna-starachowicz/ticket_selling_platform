# frozen_string_literal: true

module Forms
  class BuyTicket < ::Dry::Validation::Contract
    params do
      required(:event_id).filled(:integer)
      required(:amount).filled(:integer)
      required(:currency).maybe(:string)
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
