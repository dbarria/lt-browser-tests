# frozen_string_literal: true

require 'spec_helper'

describe 'widget', type: feature do
  let(:client_name) { Faker::Name.name }
  let(:client_message_1) { Faker::Lorem.sentence(3) }
  let(:client_message_2) { Faker::Lorem.sentence(3) }
  let(:agent_message_1) { Faker::Lorem.sentence(3) }
  let(:agent) {
    SessionSteps::Agent.new(
      email: ENV['AGENT_EMAIL'],
      password: ENV['AGENT_PASSWORD'],
      session: Capybara.current_session
    )
  }

  let(:client) {
    SessionSteps::Client.new(
      name: client_name,
      email: Faker::Internet.email,
      session: Capybara::Session.new(:client)
    )
  }

  it 'perform a normal widget conversation' do
    # Login agent
    agent.login.login

    # Client login, select inquiery and send message
    client.login.login
    client.inquiries.select_inquiry(name: 'Support')
    client.messages.send_message(message: client_message_1)

    # Agent check new client conversation, select conversation
    agent.conversations_list.expect_conversation(client_name: client_name)
    agent.conversations_list.click_new_conversation(client_name: client_name)

    # Agent check new message, join to the conversation and send a message
    agent.messages.expect_new_message(message: client_message_1)
    agent.messages.join_current_conversation
    agent.messages.send_message(message: agent_message_1)

    # Client check agent message and send a message
    client.messages.expect_new_message(message: agent_message_1)
    client.messages.send_message(message: client_message_2)

    # Agent check client message, finish the conversation
    # and check conversation disappear
    agent.messages.expect_new_message(message: client_message_2)
    agent.messages.finish_conversation
    agent.conversations_list.expect_no_conversation(client_name: client_name)

    # Client check if evaluation is displayed
    # and evaluate the conversation
    client.rate.select_yes
  end
end
