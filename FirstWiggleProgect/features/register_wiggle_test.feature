Feature: Smoke tests
  Scenario: I can register a new user
    Given I am on the wiggle homepage in "firefox" browser
    When I register a new user
    Then I can login using user credentials