# frozen_string_literal: true

module Entities
  class SoughtCheckedTicket < Dry::Struct
    attribute :id,                Types::Strict::Integer
    attribute :event_id,          Types::Strict::Integer
    attribute :reservation_token, Types::Strict::String
  end
end
