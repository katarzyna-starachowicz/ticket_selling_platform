# frozen_string_literal: true

module ReadModels
  class ReservedTicketData < Dry::Struct
    attribute :reserved_ticket, ::ReadModels::ReservedTicketDetailsData
  end
end
