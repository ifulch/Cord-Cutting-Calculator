Feature: Signing with Google
  
  As a user
  I want to signin with my email account
  So that I want to save my preferences
  
  Scenario: login with valid credentials
    Given I am on the signup page
    When I fill in "Username" with "test"
    When I fill in "Email" with "test@test.com"
    And I fill in "Password" with "test123pass"
    And I press "Sign up"
    Then I should be on the root page
    And I should see "Just begin to cut your cord, test!" 
    Given I am on the login page
    When I fill in "Email" with "test@test.com"
    And I fill in "Password" with "test123pass"
    And I press "Log in"
    Then I should be on the user page
    And I should see "You have successfully logged in."
    
  Scenario: login with invalid credentials
    Given I am on the login page
    When I fill in "Email" with "fake@fake.com"
    And I fill in "Password" with "fakepassword"
    And I press "Log in"
    Then I should be on the login page
    And I should see "Please enter the correct imformation!"