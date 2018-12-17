# frozen_string_literal: true

module Pages
  module AdminOld
    #
    # Class to define method to interact
    # with conversation messages
    #
    # @author [danielbarria]
    #
    class ConversationMessages < Page
      def send_message(message:)
        session.within '#messages' do
          session.fill_in 'write a message to customer', with: message
          session.click_button('Send')
        end
      end

      def expect_new_message(message:)
        session.within '#messages' do
          expect(session).to have_text(message)
        end
      end

      def join_current_conversation
        session.within '#messages' do
          session.click_button('Join this conversation')
        end
      end

      def finish_conversation
        session.within '#messages' do
          session.click_button('Finish')
        end
      end
    end
  end
end
