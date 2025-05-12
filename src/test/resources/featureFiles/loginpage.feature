
Feature: Launch the browser and login to ERS home page

  @smoketest
  Scenario: Navigate to home page
    Given Launch the Browser
    When Navigate to ERS Login page
    And Enter valid username and Valid password for login
    Then I validate the homepage title

  #@tag2
  #Scenario Outline: Navigate to home page
    #Given Launch the Browser
    #When Navigate to ERS Login page
    #And Enter valid username <username> and Valid password <password>
    #And Click Submit button
    #Then I validate the homepage title
#
    #Examples: 
      #| username | password |
      #| name1    |        5 |
      
      
