Feature: Verify Demand KPIs on the ERS dashboard
@smoketest
  Scenario: Validate Total, Active, On Hold, and Closed demand counts
    When the user views the demand KPI section
    Then the total number of demands should be 69
    And the number of active demands should be 63
    And the number of on hold demands should be 2
    And the number of closed demands should be 4


    Feature:Create Demand in Employee Recruitment System

    As a user of the Employee Recruitment System
      I want to create a new demand
      So that the recruitment process can begin for new positions
@smoketest
    Scenario:Successfully create a new demand
    When I click the "Create Demand" button
    Given user navigates to the demand details
    And user enters the details as
      | Department | Designation         | No.of positions | hiring plan| project       | job type| country |city     | job Description | Mandatory/Preferred skills |Hiring Start date|Hiring End date|Priority|
      |QA          | Consultant-Manual   |  2              |Project Hire| GAC-Training  |Regular  | India   |Chennai  | PDF             |Java                        | 02/06/2025      | 90 days       |P1       |
      And Click next button

      Feature: Enter Criteria for Creating a Demand

        As a recruiter
        I want to enter the required demand criteria
        So that the demand has clear and complete qualification parameters
@smoketest
        Scenario: Successfully fill in all demand criteria with valid values
          When I enter "8" year  for "Total Experience"
          And I select "Essential" for "Total Experience" type
          And I enter "Test 1" in the comments for "Total Experience"

          And I enter "1 Year" for "Minimum Relevant Experience"
          And I select "Desirable" for "Minimum Relevant Experience" type
          And I enter "Test 2" in the comments for "Minimum Relevant Experience"

          And I enter "L1 Certified" for "Minimum Certification Requirement"
          And I select "Desirable" for "Minimum Certification Requirement" type
          And I enter "Test 3" in the comments for "Minimum Certification Requirement"

          And I enter "Remote" for "Mode of Work"
          And I select "Desirable" for "Mode of Work" type
          And I enter "Test 4" in the comments for "Mode of Work"

          And I select "Yes" for "Visit Client Location"
          And I select "Desirable" for "Visit Client Location" type
          And I enter "Test 5" in the comments for "Visit Client Location"

          And I enter "1000000" for "Annual Salary (in INR)"
          And I select "Desirable" for "Annual Salary (in INR)" type
          And I enter "Test 6" in the comments for "Annual Salary (in INR)"

          And I click the "Submit" button
          Then the demand should be successfully created
          And A new demand should be created under the grid

       # Scenario: Show validation error if no criteria is marked as Essential or Desirable
         # When I leave all Essential/Desirable dropdowns empty
        #  And I click the "Submit" button
         # Then I should see a validation message saying "At least one parameter must be marked as Essential or Desirable"

Feature: View and Manage Demand Grid

  As a recruiter
  I want to view, filter, and manage demand records in a tabular grid
  So that I can track and take action on hiring demands efficiently

  Background:
    Given I am logged in as a recruiter
    And I am on the "Demands" page
@smoketest
  Scenario: View the demand grid with default columns
    Then I should see the following columns in the grid:
      | Demand          |
      | Department      |
      | Designation     |
      | Priority        |
      | Location        |
      | # Open Positions|
      | Hiring Start Date |
      | Hiring End Date |
      | Status          |
      | Updated By      |
      | Updated On      |
      | Actions         |

  Scenario: Search demands using the search bar
    When I enter "Consultant" in the search bar
    And I click the "SEARCH" button
    Then I should see only rows containing "Consultant" in the Designation column

  Scenario: Filter demands by Department and Priority
    When I select "QA" from the Department dropdown
    And I select "P1" from the Priority dropdown
    And I click the "SEARCH" button
    Then the grid should show only demands from the QA department with priority P1

  Scenario: Sort demands by Hiring Start Date
    When I click the Hiring Start Date column header
    Then the grid should sort demands by Hiring Start Date in ascending order

  Scenario: View demand status summary
    Then I should see summary counters showing:
      | TOTAL   | 70 |
      | ACTIVE  | 64 |
      | ON HOLD | 2  |
      | CLOSED  | 4  |

  Scenario: Navigate through demand pages
    When I click the next page arrow
    Then the grid should load the next set of demands

  Scenario: Open demand details
    When I click the demand ID link "DMN-00000070"
    Then I should be taken to the details page for that demand





