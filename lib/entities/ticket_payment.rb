# frozen_string_literal: true

module Entities
  class TicketPayment < Dry::Struct
    attribute :payment_token, Types::Strict::String
    attribute :user_email,    Types::Strict::String
  end
end
