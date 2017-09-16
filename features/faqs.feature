Feature: Faqs
  Scenario: Admin creates faq
    Given 1 admin
    And I am signed in as an admin
    And I follow "Overview"
    And I follow "Create FAQ"
    When I fill in "faq_question" with "Foo?"
    And I fill in the trix editor with id of "#faq_editor_trix_input_faq" with "Bar"
    And I press "Save"
    Then I should see "Foo?"
    And I should see "Bar"
    And I should see "FAQ successfully created!"

  Scenario: Admin edits faq
    Given 1 admin
    And I am signed in as an admin
    And the following faq:
      | question | Foo? |
      | answer   | Bar  |
    And I follow "Overview"
    And I follow "Foo?"
    And I follow "Edit"
    When I fill in "faq_question" with "Something?"
    And I fill in the trix editor with id of "#faq_editor_trix_input_faq" with "Else"
    And I press "Save"
    Then I should see "Something?"
    And I should see "Else"
    And I should see "FAQ successfully updated!"

  Scenario: User views faq
    Given the following faq:
      | question | Foo? |
      | answer   | Bar  |
    And I go to the "/faqs" page
    And I click the first ".question"
    Then I should see "Foo?"
    And I should see "Bar"
