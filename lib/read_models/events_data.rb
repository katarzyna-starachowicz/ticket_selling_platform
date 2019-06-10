# frozen_string_literal: true

module ReadModels
  class EventsData < Dry::Struct
    attribute :events, Types::Strict::Array.of(::ReadModels::EventDetailsData)
  end
end
