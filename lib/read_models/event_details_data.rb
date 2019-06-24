# frozen_string_literal: true

module ReadModels
  class EventDetailsData < Dry::Struct
    attribute :name,              Types::Strict::String
    attribute :date,              Types::Strict::String
    attribute :time,              Types::Strict::String
    attribute :available_tickets, Types::Strict::Integer.optional

    class << self
      def build(event_entity)
        new(
          name: event_entity.name,
          date: event_entity.date.strftime('%d %B %Y'),
          time: event_entity.time.strftime('%I:%M %p'),
          available_tickets: event_entity.available_tickets
        )
      end
    end
  end
end
