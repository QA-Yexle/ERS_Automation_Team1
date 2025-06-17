@test
Feature: SampleTest

  Scenario: Launch URL
    Given I Launch Browser
    Then I open URL
    And I login using Username as "ERS_recruiterUsername1"
    And I login using Password as "Appian12"