# frozen_string_literal: true

module Providers
  class TicketStatus
    def ticket_payment_status(sought_ticket, found_ticket)
      if sought_ticket.reservation_token != found_ticket.reservation_token
        return rejected
      end

      return 'in_progress' if reserved?(found_ticket.status)
      return 'paid' if paid?(found_ticket.status)
    end

    private

    def paid?(status)
      status == 'bought'
    end

    def rejected
      'rejected'
    end

    def reserved?(status)
      status == 'reserved'
    end

    alias bought? paid?
  end
end
