
Feature: User able to navigate and access the Candidates page

    @smokeTest
     Scenario: Display ERS dashboard with all tabs
     Given the user has successfully logged in
     When the user navigates to ERS Dashboard
     Then dashboard should display a correct Username, Designation
     And it should include the Demands, Candidates, Vendors and Bulk upload tabs


    @smokeTest
     Scenario: Navigate to Candidates page
     When the user clicks on the Candidates tab
     Then user navigate to Candidates page
     And dashboard should display Candidates data in a grid

     @smokeTest
      Scenario:Candidate creation
       Given User navigate to the Candidates page
       When user click on create candidate button
       And Enter the Basic details as
       |firstName|lastName|graduateTrainee|countryOfOrigin|aadharCard|emailId|primaryPhoneNumber|linkedInProfile|
       |Yamini   |Nagamani|Yes            |India          |678954678924|yamini@gmail.com|9876789899|www.linkedin.com/in/yamini-nagamani-a6a8761a7|
       And Enter the Education details as
       |highestDegree|college|university|graduationYear|
       |Btech        |ECET   |JNTUK     |2017          |
       And Enter the Professional details as
       |appliedDepartment|QAType|tExperienceYears|tExperienceMonths|rExperienceYears|rExperienceMonths|currentType|currentSlary|eCurrencyType|eCurrencySalary|currentLocation|preferredLocation|currentOrginisation|currentDesignation|noticePeriod|currentEmpolymentType|noticePeriodNegotiable|certification|
       |QA               |Manual |7               |2                |3               |2                |INR        |900000      |INR          |140000         |Hyderbad       |London           |Yexle Limited      |Consultant        |90          |Regular              |No                    |L1 Cerififed |
       And Enter the Other details as
       |source|vendorName|profileReceivedDate|cv|openForRelocation|citizenshipStatus|
       |External|Career     |14/05/2025         |C:\Users\yamini.nagamani\Downloads\Test Case Doc.pdf|No|Citizen|
       And user click on Add document link
       |upload document|comment|
       |C:\Users\yamini.nagamani\Downloads\Test Case Doc.pdf|No comments|
       And click on submit button
       And click Yes button on confirmation screen
       Then message displayed Candidate profile created successfully and Stage "<level>" status display "Pending Assignment"
        |level|
        |Submission   |

      @smokeTest
      Scenario:Edit the candidate details
       Given user navigate to candidates page
       When user click Application Id of the candidate
       And click the edit profile link on summary page
       And Modify the basic details as
       |emailId|
       |tom442@gmail.com|
       And click the submit button
       And click Yes button on confirmation screen
       Then message displayed Candidate details updated successfully
       And user should be able to review modified details on summary screen

       @smokeTest
       Scenario: Map the demand to candidate
        Given user navigate to Candidate summary page
        When user click Map demand link
        And Select the checkbox for related demand
        And click submit button
        And click Yes button on confirmation screen
        Then message displayed candidate added to the demand successfully and Stage "<level>" status display "Pending Screening"
         |level|
         |Screening   |

        @smokeTest
        Scenario:User able to submit screening results
         Given user navigate to Candidate summary page
         When user click Candidate screening link
         And Enter the screening details as
         |Action|Comments|
         |Passed|NA      |
         And click submit button
         Then Stage "<level>" status display "Interview Pending"
          |level|
          |L1   |

         @smokeTest
         Scenario:Schedule Level 1 interview to candidate
          Given user navigate to Candidate summary page
          When user click schedule interview link
          And Enter level 1 interview details as
          |interviewType|interviewer|meetingDate|meetingTime|duration|description|
          |Technical    |test.user@yexle.com|23/5/2025|14:30|30     |NA         |
          And click the Schedule Interview button
          Then Interview should be schedule to respective candidate and Stage "<level>" status display "Interview Scheduled"
          |level|
          |L1 - Technical|

          @smokeTest
          Scenario: Reschedule the Interview
           Given user navigate to Candidate summary page
           When user click Reschedule interview link
           And Modify the details as
           |meetingDate|meetingTime|
           |31/05/2025 |14:30      |
           And click the Re-Schedule Interview button
           Then Interview should be schedule to respective candidate and Stage "<level>" status display "Interview Scheduled"
            |level|
            |L1 - Technical|

           @smokeTest
           Scenario:Cancel the Interview
            Given user navigate to Candidate summary page
            When user click Cancel Interview link
            And click the Cancellation reason as
            |cancellationReason|
            |Panel No-show     |
            And click the Cancel Interview button
            Then Interview should be cancelled to respective candidate and Stage "<level>" status display "Interview Pending"
            |level|
            |L1   |

            @smokeTest
            Scenario:Manage Candidature
             Given user navigate to Candidate summary page
             When user click Manage candidature link
             And Enter the Manage Candidature details as
             |action|reason|comments|
             |Hold  |Demand On hold|Hold this person|
             And click the submit button
             Then status should display "Candidate On Hold"

             @smokeTest
             Scenario: Change Demand
              Given user navigate to Candidate summary page
              When user click change demand link
              And user should be view the message as "Currently the candidate is mapped to this demand"
              And select the checkbox for related demand
              And click submit button
              And click Yes button on confirmation screen
              Then message displayed candidate added to the demand successfully

              @smokeTest
              Scenario:Manage Candidature
               Given user navigate to Candidate summary page
               When user click Manage candidature link
               And Enter the Manage Candidature details as
                |action|reason|comments|
                |Rejected  |Experience Mismatch|rejected|
               And click the submit button
               Then respective candidate should not be visible in candidate grid


