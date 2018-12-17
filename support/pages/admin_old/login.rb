# frozen_string_literal: true

module Pages
  module AdminOld
    #
    # Class to define method to interact
    # with login
    #
    # @author [danielbarria]
    #
    class Login < Page
      attr_reader :email, :password
      def initialize(session:, email:, password:)
        super(session: session)
        @email = email
        @password = password
      end

      def login
        session.visit('/')
        expect_email_field
        expect_password_field
        fill_login_form
        expect(session).to have_link('Conversations')
      end

      private

      def expect_email_field
        expect(session).to have_field('Email')
      end

      def expect_password_field
        expect(session).to have_field('Password')
      end

      def fill_login_form
        session.fill_in 'Email', with: email
        session.fill_in 'Password', with: password
        session.click_button 'Sign in'
      end
    end
  end
end
