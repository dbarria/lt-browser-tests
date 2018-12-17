# frozen_string_literal: true

#
# Class to define requirement for
# a page helper class
#
# @author [danielbarria]
#
class Page
  include Capybara::DSL
  include RSpec::Matchers

  attr_reader :session

  def initialize(session:)
    @session = session
  end
end
