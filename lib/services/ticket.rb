# frozen_string_literal: true

module Services
  class Ticket
    attr_reader :ticket_repository, :reservation_token_generator,
                :ticket_status_provider

    def initialize(ticket_repository, reservation_token_generator, ticket_status_provider)
      @ticket_repository = ticket_repository
      @reservation_token_generator = reservation_token_generator
      @ticket_status_provider = ticket_status_provider
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

    def check_ticket_payment_status(checked_ticket)
      sought_ticket = build_sought_checked_ticket(checked_ticket)
      found_ticket = ticket_repository.find_checked_ticket(sought_ticket.id)

      payment_status = ticket_status_provider.checked_ticket_payment_status(
        sought_ticket,
        found_ticket
      )

      ReadModels::ReservedTicketPaymentStatusDetailsData.new(
        payment_status: payment_status
      )
    end

    private

    def build_sought_checked_ticket(ticket_params)
      ::Entities::SoughtCheckedTicket.new(
        id: ticket_params[:ticket_id],
        event_id: ticket_params[:event_id],
        reservation_token: ticket_params[:reservation_token]
      )
    end

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
