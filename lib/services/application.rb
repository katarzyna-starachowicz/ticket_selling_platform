# frozen_string_literal: true

module Services
  class Application
    def load_all_events
      event_service.load_all_events
    end

    private

    def event_service
      Event.new(event_repository)
    end

    def event_repository
      ::Repositories::Sql::Event.new
    end
  end
end
