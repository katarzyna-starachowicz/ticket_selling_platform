# frozen_string_literal: true

module Entities
  class Ticket < Dry::Struct
    attribute :price_amount,      Types::Strict::String
    attribute :price_currency,    Types::Strict::String
    attribute :status,            Types::Strict::String
    attribute :reservation_token, Types::Strict::String
    attribute :bought_by,         Types::Strict::String
  end
end
