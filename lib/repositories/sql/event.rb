# frozen_string_literal: true

module Repositories
  module Sql
    class Event
      def find_all
        ::Event.all.map do |event|
          build_entity(
            event,
            find_number_of_available_tickets(event.id)
          )
        end
      end

      def find_one(id)
        build_entity(
          ::Event.find(id),
          find_number_of_available_tickets(id)
        )
      end

      def create_event(event_entity)
        ::Event.create(
          name: event_entity.name,
          date: event_entity.date,
          time: event_entity.time
        )
      end

      private

      def find_number_of_available_tickets(event_id)
        ::Ticket.where(event_id: event_id, status: 'available').count
      end

      def build_entity(event, number_of_available_tickets)
        Entities::Event.new(
          name: event.name,
          date: event.date,
          time: event.time,
          available_tickets: number_of_available_tickets
        )
      end
    end
  end
end
