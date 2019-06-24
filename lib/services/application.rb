# frozen_string_literal: true

module Services
  class Application
    def load_all_events
      event_service.load_all_events
    end

    def load_event_details(id)
      event_service.load_event_details(id)
    end

    def buy_ticket(ticket_purchase_values)
      ticket_service.buy_ticket(ticket_purchase_values)
    end

    private

    def event_service
      ::Services::Event.new(event_repository)
    end

    def ticket_service
      ::Services::Ticket.new(
        ticket_repository,
        reservation_token_generator
      )
    end

    def event_repository
      ::Repositories::Sql::Event.new
    end

    def ticket_repository
      ::Repositories::Sql::Ticket.new
    end

    def reservation_token_generator
      ::Adapters::ReservationTokenGenerator.new
    end
  end
end
