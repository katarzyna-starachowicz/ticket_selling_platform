# frozen_string_literal: true

module Services
  class Payment
    attr_reader :payment_gateway
    def initialize(payment_gateway)
      @payment_gateway = payment_gateway
    end

    def charge(charge_order)
      reserved_ticket = Entities::ReservedTicket.new(
        charge_order.fetch(:reserved_ticket)
      )

      ticket_payment = Entities::TicketPayment.new(
        charge_order.fetch(:ticket_payment)
      )

      charge_order(ticket_payment, reserved_ticket)
    end

    private

    def charge_order(ticket_payment, reserved_ticket)
      payment_gateway.charge(
        token: ticket_payment.payment_token,
        amount: reserved_ticket.price_amount,
        currency: reserved_ticket.price_currency
      )
    end
  end
end
