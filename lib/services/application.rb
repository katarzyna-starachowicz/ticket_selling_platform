# frozen_string_literal: true

module Services
  class Application
    def load_all_events
      event_service.load_all_events
    end

    def load_event_details(id)
      event_service.load_event_details(id)
    end

    private

    def event_service
      ::Services::Event.new(event_repository)
    end

    def event_repository
      ::Repositories::Sql::Event.new
    end
  end
end
