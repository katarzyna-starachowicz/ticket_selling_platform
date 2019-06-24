# frozen_string_literal: true

module Errors
  class Presenter
    attr_reader :errors

    def initialize(error)
      @errors = error.message
    end
  end
end
