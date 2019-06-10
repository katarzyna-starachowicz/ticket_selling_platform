# frozen_string_literal: true

module Api
  module V1
    class EventsController < BaseController
      def index
        respond_with application.load_all_events
      end
    end
  end
end
