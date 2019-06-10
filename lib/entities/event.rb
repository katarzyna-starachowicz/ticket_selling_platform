# frozen_string_literal: true

module Entities
  class Event < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :time, Types::Strict::Time
  end
end
