# frozen_string_literal: true

module ReadModels
  class ReservedTicketPaymentStatusDetailsData < Dry::Struct
    attribute :payment_status, Types::Strict::String
  end
end
