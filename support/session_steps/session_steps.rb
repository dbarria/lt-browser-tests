# frozen_string_literal: true

module SessionSteps
  #
  # Class managae session steps.
  # Add method missing to add @page keys as methods
  #
  # @author [danielbarria]
  #
  class SessionSteps
    attr_reader :pages

    def method_missing(method, *args, &block)
      if pages.key? method
        pages[method]
      else
        super
      end
    end

    # This method smells of :reek:ControlParameter
    def respond_to_missing?(method, *)
      pages.key?(method) || super
    end
  end
end
