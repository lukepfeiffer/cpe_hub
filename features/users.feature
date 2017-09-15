Feature: Users
  Scenario: User signs up
    Given I am on the home page
    And I follow "Sign in"
    And I follow "Not a user? Register here!"
    When I fill in "user_email" with "foo@bar"
    And I fill in "user_password" with "foo"
    And I fill in "user_password_confirmation" with "foo"
    And I fill in "user_username" with "foobar"
    And I press "Save"
    Then I should be on the "/" page
    And I should see "Signed up! Check your email to confirm account."
