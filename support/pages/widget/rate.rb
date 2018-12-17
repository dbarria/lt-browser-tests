# frozen_string_literal: true

module Pages
  module Widget
    #
    # Class to define method to interact
    # with rates
    #
    # @author [danielbarria]
    #
    class Rate < Page
      def select_yes
        session.within_frame 'lt-messenger-iframe' do
          session.click_button 'Sí'
        end
      end
    end
  end
end
