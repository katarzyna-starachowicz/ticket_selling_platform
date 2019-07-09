# frozen_string_literal: true

class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(opts)
    charge_order = validate_charge!(opts)

    application.pay_for_ticket(charge_order)
    bought_ticket = application.buy_ticket(charge_order)

    logger.info(
      "Ticket #{bought_ticket.id} bought by #{bought_ticket.buyer_email}"
    )
  rescue Adapters::PaymentGateway::CardError, Adapters::PaymentGateway::PaymentError
    application.release_ticket(reserved_ticket)
  end

  private

  def validate_charge!(opts)
    charge_form = Forms::ChargeOrder.new.call(opts)
    raise 'AAAA' if charge_form.failure?

    charge_form.values
  end

  def application
    Services::Application.new
  end
end
