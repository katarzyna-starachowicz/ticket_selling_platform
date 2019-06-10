# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    respond_to :json

    protected

    def application
      Services::Application.new
    end
  end
end
