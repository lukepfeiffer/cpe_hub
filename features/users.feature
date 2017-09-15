Feature: Users
  Scenario: User signs up
    Given I am on the home page
    And I follow "Sign In"
    And I follow "Not registered? Create an account."
    When I fill in "user_email" with "foo@bar"
    And I fill in "user_password" with "foo"
    And I fill in "user_password_confirmation" with "foo"
    And I fill in "user_username" with "foobar"
    And I press "Save"
    Then I should be on the "/" page
    And I should see "Signed up! Check your email to confirm account."

  Scenario: User Signs In
    Given 1 user
    And I am on the home page
    And I follow "Sign In"
    When I fill in "sign_in_email" with "email@example.com"
    And I fill in "sign_in_password" with "password"
    And I press "Sign In"
    Then I should be on the "/" page
    And I should see "Signed in successfully!"
