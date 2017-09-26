Feature: Professors
  Scenario: Admin creates professor
    Given 1 admin
    And I am signed in as an admin
    And I follow "Overview"
    And I follow "Create Professor"
    When I fill in "professor_first_name" with "Foo"
    And I fill in "professor_last_name" with "Bar"
    And I select "Mr." from "professor_title"
    And I fill in "professor_rating" with "8"
    And I fill in the trix editor with id of "#professor_editor_trix_input_professor" with "Description for professor"
    And I press "Save"
    Then I should see "Mr. Bar, Foo"
    And I should see "Description for professor"
    And I should see "8"
    And I should see "Professor successfully created!"
  Scenario: Admin updates professor
  Scenario: User views professor
    Given the following professor:
      | title       | Dr.      |
      | first_name  | Eric     |
      | last_name   | Schwartz |
    And I am on the "/professors" page
    Then I should see "Dr. Schwartz, Eric"
