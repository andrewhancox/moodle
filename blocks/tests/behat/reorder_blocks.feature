@core @core_block
Feature: Reorder blocks
  In order to control the order of blocks
  As an administrator
  I need to be able to reorder blocks

  @javascript
  Scenario: Reorder blocks on the homepage
    Given I log in as "admin"
    And I am on site homepage
    And I follow "Turn editing on"

    # Set administration to appear before navigation.
    And I configure the "Administration" block
    And I set the following fields to these values:
      | Weight | -10 |
    And I press "Save changes"
    And I configure the "Navigation" block
    And I set the following fields to these values:
      | Weight | 10 |
    And I press "Save changes"
    Then "Administration" "block" should appear before "Navigation" "block"

    # Set navigation to appear before administration.
    And I configure the "Administration" block
    And I set the following fields to these values:
      | Weight | 10 |
    And I press "Save changes"
    And I configure the "Navigation" block
    And I set the following fields to these values:
      | Weight | -10 |
    And I press "Save changes"
    Then "Navigation" "block" should appear before "Administration" "block"


  @javascript
  Scenario: Move sticky blocks on sub pages
    Given I log in as "admin"
    And I am on site homepage
    And I follow "Turn editing on"

    # Set navigation to appear before administration by default.
    And I configure the "Administration" block
    And I set the following fields to these values:
      | Default weight | 10 |
    And I press "Save changes"
    And I configure the "Navigation" block
    And I set the following fields to these values:
      | Default weight | -10 |
    And I press "Save changes"

    # Navigate to courses and check order is still the same.
    And I follow "Courses"
    Then "Navigation" "block" should appear before "Administration" "block"

    # Switch order around on courses page.
    And I configure the "Administration" block
    And I set the following fields to these values:
      | Weight | -10 |
    And I press "Save changes"
    And I configure the "Navigation" block
    And I set the following fields to these values:
      | Weight | 10 |
    And I press "Save changes"
    Then "Administration" "block" should appear before "Navigation" "block"

    # Order should be unchanged on home page.
    And I am on site homepage
    Then "Navigation" "block" should appear before "Administration" "block"
