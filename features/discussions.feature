Feature: Discussions
  Scenario: User creates discussion post
    Given 1 user
    And the following course:
      | name        | New course    |
      | difficulty  | 1             |
      | course_type | Tech Elective |
      | course_code | COP3502       |
    And I am signed in as a user
    And I am on the "/discussions" page
    And I follow "Create Discussion"
    And I fill in "discussion_question" with "Bar"
    And I select "New Course" from "discussion_course_id"
    And I fill in the trix editor with id of "#description_editor_trix_input_discussion" with "This is the description of the question."
    And I press "Save"
    Then I should see "Bar"
    And I should see "COP3502"
    And I should see "This is the description of the question."
    And I should see "Discussion successfully created!"

  # Scenario: Admin adds notes to discussion post
  #   Given 1 admin
  #   And I am signed in as an admin
  #   And I am on the "/discussions" page
  #   And I follow "Discussion"
  #   And I follow "Edit"
  #   When I fill in "discussion_admin_notes" with "This is a note"
  #   And I press "Save"
  #   Then I should see "This is a note"
