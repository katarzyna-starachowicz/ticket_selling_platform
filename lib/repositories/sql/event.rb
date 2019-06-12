# frozen_string_literal: true

module Repositories
  module Sql
    class Event
      def find_all
        ::Event.all.map { |event| build_entity(event) }
      end

      def find_one(id)
        ::Event.find(id)
      end

      def create_event(event_entity)
        ::Event.create(
          name: event_entity.name,
          date: event_entity.date,
          time: event_entity.time
        )
      end

      private

      def build_entity(event)
        Entities::Event.new(
          name: event.name,
          date: event.date,
          time: event.time
        )
      end
    end
  end
end
