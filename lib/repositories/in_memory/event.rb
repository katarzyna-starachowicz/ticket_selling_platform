# frozen_string_literal: true

module Repositories
  module InMemory
    class Event
      attr_accessor :events

      def initialize
        @events = []
      end

      def find_all
        events
      end

      def create_event(event_entity)
        events << event_entity
      end
    end
  end
end
