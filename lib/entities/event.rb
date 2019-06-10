# frozen_string_literal: true

module Entities
  class Event < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :date, Types::Date
    attribute :time, Types::Time
  end
end
