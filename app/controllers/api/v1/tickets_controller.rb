# frozen_string_literal: true

module Api
  module V1
    class TicketsController < BaseController
      def create
        purchase_form = Forms::BuyTicket.new.call(purchase_params)
        validate_form!(purchase_form)

        render json: application.buy_ticket(purchase_form.values)
      rescue Errors::TicketSellingPlatformError => e
        respond_with Errors::Presenter.new(e), status: 422
      end

      private

      def purchase_params
        params
          .permit(:event_id, :amount, :currency, :payment_token, :user_email)
          .to_h
          .symbolize_keys
      end
    end
  end
end
