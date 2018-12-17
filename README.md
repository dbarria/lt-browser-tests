# lt-browser-tests
Opinionated structure for capybara browser tests using standalone RSpec

This project use following principles:

- Two browser sessions
- Pages classes that store capybara methods for specific page
  - Every page class inherits from /support/pages/page.rb to add Capybara::DSL, RSpec::Matchers and define session instance var
  - Use namespace to separate every system and pages to scope helpers
- SessionSteps classes to define what pages can be access by a user type
  - Every class must inherit from support/session_steps/session_steps.rb to add helper methods to User type instance
