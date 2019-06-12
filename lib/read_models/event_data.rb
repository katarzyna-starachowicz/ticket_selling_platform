# frozen_string_literal: true

module ReadModels
  class EventData < Dry::Struct
    attribute :event, ::ReadModels::EventDetailsData
  end
end
