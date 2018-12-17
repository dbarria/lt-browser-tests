# frozen_string_literal: true

module Pages
  module Widget
    #
    # Class to define method to interact
    # with login
    #
    # @author [danielbarria]
    #
    class Login < Page
      attr_reader :email, :name
      def initialize(session:, name:, email:)
        super(session: session)
        @name = name
        @email = email
      end

      def login
        visit_widget_examples
        session.within_frame 'lt-messenger-iframe' do
          session.fill_in 'nombre', with: name
          session.fill_in 'email', with: email
          session.click_button 'Comenzar'
        end
      end

      private

      def visit_widget_examples
        session.visit(ENV['WIDGET_URL'])
        session.click_button('Chat')
        expect(session).to have_selector('#lt-messenger-iframe')
      end
    end
  end
end
