# frozen_string_literal: true

require 'rails_helper'

describe Services::Event do
  let(:event_service)    { described_class.new(event_repository) }
  let(:event_repository) { Repositories::InMemory::Event.new }

  include_context 'two events'

  describe '#load_all_events' do
    it 'returns events data' do
      expect(event_service.load_all_events)
        .to be_an_instance_of(ReadModels::EventsData)
    end

    it 'returns all events data' do
      expect(event_service.load_all_events.events.count).to eq(2)
    end

    it 'returns formatted date' do
      expect(event_service.load_all_events.events.first.date)
        .to eq('19 October 2019')
    end

    it 'returns formatted time' do
      expect(event_service.load_all_events.events.first.time).to eq('05:00 PM')
    end
  end
end
