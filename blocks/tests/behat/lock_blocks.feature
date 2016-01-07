@core @core_block
Feature: Lock blocks
  In order to prevent users changing the order of blocks
  As an administrator
  I need to be able to lock the order of blocks

  @javascript @wip
  Scenario: Lock blocks
    Given I log in as "admin"
    And I am on site homepage
    And I follow "Turn editing on"

    # Set administration to appear before navigation by default.
    And I configure the "Administration" block
    And I set the following fields to these values:
      | Default weight | 0 |
    And I press "Save changes"
    And I configure the "Navigation" block
    And I set the following fields to these values:
      | Default weight | 10 |
    And I press "Save changes"

    # Set navigation to appear before administration on courses page.
    And I follow "Courses"
    And I configure the "Navigation" block
    And I set the following fields to these values:
      | Weight | -10 |
    And I press "Save changes"
    Then "Navigation" "block" should appear before "Administration" "block"

    # Lock the navigation block to it's defaults.
    And I am on site homepage
    And I configure the "Navigation" block
    And I set the following fields to these values:
      | Locked | Yes |
    And I press "Save changes"

    # Drag and drop move should not be available on locked blocks.
    Then "img[alt='Move Navigation block']" "css_element" should not exist
    And "img[alt='Move Administration block']" "css_element" should exist

    # Navigation should now stick to it's default weight on the courses page.
    And I follow "Courses"
    Then "Administration" "block" should appear before "Navigation" "block"