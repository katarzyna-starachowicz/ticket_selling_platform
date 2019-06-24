# frozen_string_literal: true

RSpec.shared_context 'two events' do
  let(:event_1) do
    Entities::Event.new(
      name: 'Name 1',
      date: Date.new(2019, 10, 19),
      time: Time.new(2019, 10, 19, 17, 0),
      available_tickets: nil
    )
  end

  let(:event_2) do
    Entities::Event.new(
      name: 'Name 2',
      date: Date.new(2019, 10, 19),
      time: Time.new(2019, 10, 19, 18, 30),
      available_tickets: nil
    )
  end

  before do
    event_repository.create_event(event_1)
    event_repository.create_event(event_2)
  end
end
