# frozen_string_literal: true

module Services
  class Event
    attr_reader :event_repository

    def initialize(event_repository)
      @event_repository = event_repository
    end

    def load_all_events
      all_events = event_repository.find_all

      ReadModels::EventsData.new(
        events: all_events.map { |event| ReadModels::EventDetailsData.build(event) }
      )
    end
  end
end
