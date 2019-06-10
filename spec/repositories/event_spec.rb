# frozen_string_literal: true

require 'rails_helper'

describe 'Event Respository' do
  let(:event_repository) { subject }

  shared_examples_for 'event repository' do
    describe '#find_all' do
      let(:returned_event_1) { event_repository.find_all.first }
      let(:returned_event_2) { event_repository.find_all.second }

      context 'first event' do
        it 'returns proper event name' do
          expect(returned_event_1.name).to eq(event_1.name)
        end

        it 'returns proper date year' do
          expect(returned_event_1.date.year).to eq(event_1.date.year)
        end

        it 'returns proper date month' do
          expect(returned_event_1.date.month).to eq(event_1.date.month)
        end

        it 'returns proper date day' do
          expect(returned_event_1.date.day).to eq(event_1.date.day)
        end

        it 'returns proper time hour' do
          expect(returned_event_1.time.hour).to eq(event_1.time.hour)
        end

        it 'returns proper time minutes' do
          expect(returned_event_1.time.min).to eq(event_1.time.min)
        end

        it 'returns proper time seconds' do
          expect(returned_event_2.time.sec).to eq(event_2.time.sec)
        end
      end

      context 'second event' do
        it 'returns proper event name' do
          expect(returned_event_2.name).to eq(event_2.name)
        end

        it 'returns proper date year' do
          expect(returned_event_2.date.year).to eq(event_2.date.year)
        end

        it 'returns proper date month' do
          expect(returned_event_2.date.month).to eq(event_2.date.month)
        end

        it 'returns proper date day' do
          expect(returned_event_2.date.day).to eq(event_2.date.day)
        end

        it 'returns proper time hour' do
          expect(returned_event_2.time.hour).to eq(event_2.time.hour)
        end

        it 'returns proper time minutes' do
          expect(returned_event_2.time.min).to eq(event_2.time.min)
        end

        it 'returns proper time seconds' do
          expect(returned_event_1.time.sec).to eq(event_1.time.sec)
        end
      end
    end
  end

  describe Repositories::Sql::Event do
    include_context 'two events'
    after { DatabaseCleaner.clean }

    it_behaves_like 'event repository'
  end

  describe Repositories::InMemory::Event do
    include_context 'two events'
    it_behaves_like 'event repository'
  end
end
