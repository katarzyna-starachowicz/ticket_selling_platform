# frozen_string_literal: true

require 'securerandom'

module Adapters
  class ReservationTokenGenerator
    def generate
      SecureRandom.hex
    end
  end
end
