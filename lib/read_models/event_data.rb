# frozen_string_literal: true

module ReadModels
  class EventData < Dry::Struct
    attribute :event, Types::Strict::Array.of(EventDetailsData)
  end
end
