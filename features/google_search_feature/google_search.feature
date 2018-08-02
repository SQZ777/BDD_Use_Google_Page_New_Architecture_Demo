Feature: Login feature

  Scenario: As a valid user I can search at google website
    Given I go to Google web site
    When I search "cool"
    Then I see "cool"
