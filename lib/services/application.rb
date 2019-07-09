# frozen_string_literal: true

module Services
  class Application
    def load_all_events
      event_service.load_all_events
    end

    def load_event_details(id)
      event_service.load_event_details(id)
    end

    def request_ticket_payment(ticket_payment_request)
      ticket_service.request_ticket_payment(ticket_payment_request)
    end

    def pay_for_ticket(charge_order)
      payment_service.charge(charge_order)
    end

    def buy_ticket(charge_order)
      ticket_service.buy_ticket(charge_order)
    end

    def release_ticket(reserved_ticket)
      ticket_service.release_ticket(reserved_ticket)
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

    def payment_service
      ::Services::Payment.new(
        payment_gateway
      )
    end

    def event_repository
      ::Repositories::Sql::Event.new
    end

    def ticket_repository
      ::Repositories::Sql::Ticket.new
    end

    def payment_gateway
      ::Adapters::PaymentGateway
    end

    def reservation_token_generator
      ::Adapters::ReservationTokenGenerator.new
    end
  end
end
