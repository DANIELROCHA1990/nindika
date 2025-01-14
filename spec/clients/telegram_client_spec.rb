# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TelegramClient, type: :clients do
  describe 'Configurations' do
    it 'has default base_uri' do
      expect(described_class.base_uri).to eq 'https://api.telegram.org'
    end
  end

  describe '#send_message' do
    subject(:client) { described_class.new }

    let(:bot_token) { Faker::Lorem.word }
    let(:chat_id) { Faker::Lorem.word }
    let(:text) { Faker::Lorem.paragraph }
    let(:response) { Faker::Types.rb_hash(number: 4).stringify_keys }

    before do
      stub_request(:post, "#{described_class.base_uri}/bot#{bot_token}/sendMessage")
        .with(body: { chat_id: chat_id, text: text, parse_mode: 'HTML' })
        .to_return(body: response.to_json, headers: { 'Content-Type' => 'application/json' })
    end

    it 'requests /sendMessage with given text, chat id and bot token' do
      expect(client.send_message(bot_token: bot_token, chat_id: chat_id, text: text)).to eq response
    end
  end
end
