# frozen_string_literal: true

module Pages
  module Widget
    #
    # Class to define method to interact
    # with inquiery window
    #
    # @author [danielbarria]
    #
    class Inquiries < Page
      def select_inquiry(name:)
        session.within_frame 'lt-messenger-iframe' do
          session.find('a', text: name).click
        end
      end
    end
  end
end
