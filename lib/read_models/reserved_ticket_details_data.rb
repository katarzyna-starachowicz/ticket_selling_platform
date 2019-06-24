# frozen_string_literal: true

module ReadModels
  class ReservedTicketDetailsData < Dry::Struct
    attribute :id,                Types::Strict::Integer
    attribute :event_id,          Types::Strict::Integer
    attribute :reservation_token, Types::Strict::String

    class << self
      def build(ticket_entity)
        new(
          id: ticket_entity.id,
          event_id: ticket_entity.event_id,
          reservation_token: ticket_entity.reservation_token
        )
      end
    end
  end
end
