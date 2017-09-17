Feature: Courses
  Scenario: Admin creates course
    Given 1 admin
    And I am signed in as an admin
    And I follow "Overview"
    And I follow "Create Course"
    When I select "Tech Elective" from "course_course_type"
    And I fill in "course_name" with "Foo"
    And I fill in "course_course_code" with "Bar"
    And I fill in "course_difficulty" with "7"
    And I fill in the trix editor with id of "#course_editor_trix_input_course" with "Description"
    And I press "Save"
    Then I should see "Course successfully created!"
    And I should see "Tech Elective"
    And I should see "Foo"
    And I should see "Bar"
    And I should see "7"
    And I should see "Description"

  Scenario: Admin updates course
    Given 1 admin
    And I am signed in as an admin
    And the following course:
      | name        | Foo           |
      | description | Something     |
      | difficulty  | 1             |
      | course_type | Tech Elective |
      | course_code | FOO1111       |
    And I follow "Overview"
    And I follow "Foo"
    And I follow "Edit"
    When I fill in "course_name" with "Something else"
    And I press "Save"
    Then I should see "Something else"
    And I should see "Course successfully updated!"

  Scenario: User view course
    Given I am on the root path
    And the following course:
      | name        | Not tech elective |
      | course_type | Breadth           |
    And the following course:
      | name        | Tech Elective  1 |
      | course_type | Tech Elective    |
    And I go to the "/courses?type=tech_elective" page
    Then I should see "Tech Elective 1"
    And I should not see "Not tech elective"
