# frozen_string_literal: true

module Forms
  class TicketPaymentCheck < ::Dry::Validation::Contract
    params do
      required(:event_id).filled(:integer)
      required(:reservation_token).filled(:string)
      required(:ticket_id).filled(:integer)
    end
  end
end
