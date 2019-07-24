# frozen_string_literal: true

module Api
  module V1
    class TicketsController < BaseController
      def create
        payment_form = Forms::TicketPaymentRequest.new.call(payment_params)
        validate_form!(payment_form)

        render json: application.request_ticket_payment(payment_form.values), status: 201
      rescue Errors::TicketSellingPlatformError => e
        respond_with Errors::Presenter.new(e), status: 422
      end

      def show
        ticket_form = Forms::TicketPaymentCheck.new.call(ticket_params)
        validate_form!(ticket_form)

        render json: application.check_ticket_payment_status(ticket_form.values), status: 200
      rescue Errors::TicketSellingPlatformError => e
        respond_with Errors::Presenter.new(e), status: 422
      end

      private

      def payment_params
        handle_params(:event_id, :payment_token, :user_email)
      end

      def ticket_params
        handle_params(:event_id, :reservation_token, :ticket_id)
      end

      def handle_params(*chosen_params)
        params
          .permit(chosen_params)
          .to_h
          .symbolize_keys
      end
    end
  end
end
