# frozen_string_literal: true

module Entities
  class BoughtTicket < Dry::Struct
    attribute :id,          Types::Strict::Integer
    attribute :buyer_email, Types::Strict::String
  end
end
