# frozen_string_literal: true

module Services
  class Event
    attr_reader :event_repository

    def initialize(event_repository)
      @event_repository = event_repository
    end

    def load_all_events
      all_events = event_repository.find_all
      all_events_data = all_events.map do |event|
        ReadModels::EventDetailsData.build(event)
      end

      ReadModels::EventsData.new(
        events: all_events_data
      )
    end

    def load_event_details(id)
      event = event_repository.find_one(id)
      ReadModels::EventData.new(
        event: ReadModels::EventDetailsData.build(event)
      )
    end
  end
end
