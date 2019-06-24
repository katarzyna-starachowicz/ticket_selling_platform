# frozen_string_literal: true

module Services
  class Ticket
    attr_reader :ticket_repository, :reservation_token_generator

    def initialize(ticket_repository, reservation_token_generator)
      @ticket_repository = ticket_repository
      @reservation_token_generator = reservation_token_generator
    end

    def buy_ticket(ticket_purchase_values)
      reservation_token = reservation_token_generator.generate

      reserved_ticket = ticket_repository.reserve_one_for_event(
        ticket_purchase_values.fetch(:event_id),
        reservation_token
      )

      # TODO, process payment in background job
      # ProcessTicketPaymentJob.perform(reserved_ticket, ticket_payment_entity)
      ReadModels::ReservedTicketData.new(
        reserved_ticket: ReadModels::ReservedTicketDetailsData.build(
          reserved_ticket
        )
      )
    end
  end
end
