# frozen_string_literal: true

module Pages
  module Widget
    #
    # Class to define method to interact
    # with messages window
    #
    # @author [danielbarria]
    #
    class Messages < Page
      def send_message(message:)
        session.within_frame 'lt-messenger-iframe' do
          session.fill_in 'Escribe un mensaje...', with: message
          session.click_button 'widget-send-message'
        end
      end

      def select_inquiry(name:)
        session.within_frame 'lt-messenger-iframe' do
          session.find('a', text: name).click
        end
      end

      def expect_new_message(message:)
        session.within_frame 'lt-messenger-iframe' do
          expect(session).to have_text(message)
        end
      end
    end
  end
end
