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

      private

      def payment_params
        params
          .permit(:event_id, :payment_token, :user_email)
          .to_h
          .symbolize_keys
      end
    end
  end
end
