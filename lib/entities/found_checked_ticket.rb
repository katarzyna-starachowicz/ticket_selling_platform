# frozen_string_literal: true

module Entities
  class FoundCheckedTicket < Dry::Struct
    attribute :id,                Types::Strict::Integer
    attribute :event_id,          Types::Strict::Integer
    attribute :reservation_token, Types::Strict::String.optional
    attribute :status,            Types::Strict::String
  end
end
