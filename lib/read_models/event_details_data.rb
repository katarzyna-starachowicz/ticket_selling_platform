# frozen_string_literal: true

module ReadModels
  class EventDetailsData < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :date, Types::Date
    attribute :time, Types::Time

    class << self
      def build(event_entity)
        new(
          name: event_entity.name,
          date: event_entity.date,
          time: event_entity.time
        )
      end
    end
  end
end
