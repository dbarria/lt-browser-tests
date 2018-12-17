# frozen_string_literal: true

module SessionSteps
  #
  # Class to encapsulate logic
  # to interact with agent panel
  #
  # @author [danielbarria]
  #
  class Agent < SessionSteps
    include Pages::AdminOld
    attr_reader :session

    def initialize(email:, password:, session:)
      @session = session
      @pages = {
        conversations_list: ConversationsList.new(session: @session),
        messages: ConversationMessages.new(session: @session),
        login: Login.new(session: @session, email: email, password: password)
      }
    end
  end
end
