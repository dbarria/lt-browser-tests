# frozen_string_literal: true

module Pages
  module AdminOld
    #
    # Class to define method to interact
    # with conversation feed
    #
    # @author [danielbarria]
    #
    class ConversationsList < Page
      def expect_conversation(client_name:)
        session.within '#conversations-list' do
          expect(session).to have_text(client_name)
        end
      end

      def expect_no_conversation(client_name:)
        session.within '#conversations-list' do
          expect(session).to have_no_selector(
            'div.conversation strong[ng-show="conversation.title"]',
            text: client_name
          )
        end
      end

      def click_new_conversation(client_name:)
        session.within '#conversations-list' do
          session.find(
            'div.conversation strong[ng-show="conversation.title"]',
            text: client_name
          ).click
        end
      end
    end
  end
end
