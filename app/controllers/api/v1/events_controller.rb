# frozen_string_literal: true

module Api
  module V1
    class EventsController < BaseController
      def index
        respond_with application.load_all_events
      end

      def show
        respond_with application.load_event_details(params[:id].to_i)
      end
    end
  end
end
