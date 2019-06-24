# frozen_string_literal: true

module Entities
  class ReservedTicket < Dry::Struct
    attribute :id,                Types::Strict::Integer
    attribute :event_id,          Types::Strict::Integer
    attribute :price_amount,      Types::Strict::Float
    attribute :price_currency,    Types::Strict::String
    attribute :reservation_token, Types::Strict::String
  end
end
