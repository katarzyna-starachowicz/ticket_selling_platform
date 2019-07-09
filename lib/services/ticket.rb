# frozen_string_literal: true

module Services
  class Ticket
    attr_reader :ticket_repository, :reservation_token_generator

    def initialize(ticket_repository, reservation_token_generator)
      @ticket_repository = ticket_repository
      @reservation_token_generator = reservation_token_generator
    end

    def request_ticket_payment(ticket_purchase_values)
      reserved_ticket = reserve_ticket(ticket_purchase_values)

      ChargeOrderJob.perform_later(
        reserved_ticket: reserved_ticket.to_h,
        ticket_payment: build_ticket_payment(ticket_purchase_values).to_h
      )

      ReadModels::ReservedTicketData.new(
        reserved_ticket: ReadModels::ReservedTicketDetailsData.build(
          reserved_ticket
        )
      )
    end

    def buy_ticket(charge_order)
      reserved_ticket = Entities::ReservedTicket.new(
        charge_order.fetch(:reserved_ticket)
      )

      ticket_payment = Entities::TicketPayment.new(
        charge_order.fetch(:ticket_payment)
      )

      ticket_repository.buy_one(reserved_ticket, ticket_payment.user_email)
    end

    private

    def build_ticket_payment(payment_values)
      ::Entities::TicketPayment.new(
        payment_token: payment_values.fetch(:payment_token),
        user_email: payment_values.fetch(:user_email)
      )
    end

    def reserve_ticket(ticket_values)
      reservation_token = reservation_token_generator.generate

      ticket_repository.reserve_one_for_event(
        ticket_values.fetch(:event_id),
        reservation_token
      )
    end
  end
end
