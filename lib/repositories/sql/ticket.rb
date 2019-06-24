# frozen_string_literal: true

module Repositories
  module Sql
    class Ticket
      # rubocop:disable Metrics/MethodLength
      def reserve_one_for_event(event_id, reservation_token)
        tries = 0
        begin
          tries += 1
          ticket = ::Ticket.find_by(event_id: event_id, status: 'available')

          ticket.update(
            status: 'reserved',
            reservation_token: reservation_token
          )

          validate_ticket!(ticket)

          build_reserved_ticket_entity(ticket)
        rescue ActiveRecord::StaleObjectError
          retry if tries < 3
          raise_no_available_tickets(event_id)
        end
      end
      # rubocop:enable Metrics/MethodLength

      def build_reserved_ticket_entity(ticket)
        Entities::ReservedTicket.new(
          id: ticket.id,
          event_id: ticket.event_id,
          price_amount: ticket.price_amount,
          price_currency: ticket.price_currency,
          reservation_token: ticket.reservation_token
        )
      end

      private

      def validate_ticket!(ticket)
        raise_no_available_tickets_error(event_id) if ticket.blank?
      end

      def raise_no_available_tickets_error(event_id)
        raise(
          Errors::NoAvailableTicketsError,
          "No available ticket for event #{event_id}"
        )
      end
    end
  end
end
