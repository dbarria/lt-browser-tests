# frozen_string_literal: true

module SessionSteps
  #
  # Class to encapsulate logic
  # to interact with client in a widget
  #
  # @author [danielbarria]
  #
  class Client < SessionSteps
    include Pages::Widget
    attr_reader :session, :pages

    def initialize(name:, email:, session:)
      @session = session
      @pages = {
        inquiries: Inquiries.new(session: @session),
        messages: Messages.new(session: @session),
        rate: Rate.new(session: @session),
        login: Login.new(session: @session, name: name, email: email)
      }
    end
  end
end
