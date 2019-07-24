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

          validate_ticket!(ticket, event_id)

          ticket.update(
            status: 'reserved',
            reservation_token: reservation_token
          )

          build_reserved_ticket_entity(ticket)
        rescue ActiveRecord::StaleObjectError
          retry if tries < 3
          raise_no_available_tickets(event_id)
        end
      end
      # rubocop:enable Metrics/MethodLength

      def buy_one(reserved_ticket, buyer_email)
        ticket = ::Ticket.find(reserved_ticket.id)
        ticket.update(
          status: 'bought',
          bought_by: buyer_email
        )

        build_bought_ticket_entity(ticket)
      end

      def build_reserved_ticket_entity(ticket)
        Entities::ReservedTicket.new(
          id: ticket.id,
          event_id: ticket.event_id,
          price_amount: ticket.price_amount,
          price_currency: ticket.price_currency,
          reservation_token: ticket.reservation_token
        )
      end

      def find_checked_ticket(id)
        ticket = ::Ticket.find(id)

        Entities::FoundCheckedTicket.new(
          id: ticket.id,
          event_id: ticket.event_id,
          reservation_token: ticket.reservation_token,
          status: ticket.status
        )
      end

      private

      def build_bought_ticket_entity(ticket)
        Entities::BoughtTicket.new(
          id: ticket.id,
          buyer_email: ticket.bought_by
        )
      end

      def validate_ticket!(ticket, event_id)
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
