# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    respond_to :json

    protected

    def application
      Services::Application.new
    end

    def validate_form!(form)
      raise_unprocessable_entity_error(form) if form.failure?
    end

    def raise_unprocessable_entity_error(form)
      raise Errors::UnprocessableEntityError, form.errors.to_h
    end
  end
end
