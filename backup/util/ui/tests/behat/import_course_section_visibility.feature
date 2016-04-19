@core @core_backup
Feature: Import course's contents into another course
  In order to move and copy contents between courses
  As a teacher
  I need to import a course contents into another course selecting what I want to import

  Background:
    Given the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "activities" exist:
      | activity | name                   | intro                       | course | idnumber | section |
      | assign   | Test assignment name 1 | Test assignment description | C1     | assign1  | 1       |
      | assign   | Test assignment name 2 | Test assignment description | C1     | assign2  | 2       |
      | assign   | Test assignment name 3 | Test assignment description | C1     | assign3  | 3       |
      | assign   | Test assignment name 4 | Test assignment description | C1     | assign4  | 4       |
      | assign   | Test assignment name 5 | Test assignment description | C1     | assign5  | 5       |
      | assign   | Test assignment name 6 | Test assignment description | C1     | assign6  | 6       |

  @javascript
  Scenario: Import all sections from course 1 into course 2 where course 1 has more sections.
    Given the following "courses" exist:
      | fullname | shortname | category | numsections |
      | Course 2 | C2        | 0        | 1           |
    And I log in as "admin"
    When I import "Course 1" course into "Course 2" course using this options:
      | Initial | Include activities and resources | 1 |
      | Schema  | Topic 1                          | 1 |
      | Schema  | Topic 2                          | 1 |
      | Schema  | Topic 3                          | 1 |
      | Schema  | Topic 4                          | 1 |
      | Schema  | Topic 5                          | 1 |
      | Schema  | Topic 6                          | 1 |
    And I should see "Test assignment name 1" in the "#section-1" "css_element"
    And I should see "Test assignment name 2" in the "#section-2" "css_element"
    And I should see "Test assignment name 3" in the "#section-3" "css_element"
    And I should see "Test assignment name 4" in the "#section-4" "css_element"
    And I should see "Test assignment name 5" in the "#section-5" "css_element"
    And I should see "Test assignment name 6" in the "#section-6" "css_element"

  @javascript
  Scenario: Import last section from last section of course 1 into course 2 where course 1 has more sections.
    Given the following "courses" exist:
      | fullname | shortname | category | numsections |
      | Course 2 | C2        | 0        | 1           |
    And I log in as "admin"
    When I import "Course 1" course into "Course 2" course using this options:
      | Initial | Include activities and resources | 1 |
      | Initial | Create empty sections            | 1 |
      | Schema  | Topic 1                          | 0 |
      | Schema  | Topic 2                          | 0 |
      | Schema  | Topic 3                          | 0 |
      | Schema  | Topic 4                          | 0 |
      | Schema  | Topic 5                          | 0 |
      | Schema  | Topic 6                          | 1 |
    And I should see "Test assignment name 6" in the "#section-6" "css_element"

  @javascript
  Scenario: Import alternate sections from course 1 into course 2 where course 1 has more sections.
    Given the following "courses" exist:
      | fullname | shortname | category | numsections |
      | Course 2 | C2        | 0        | 1           |
    And I log in as "admin"
    When I import "Course 1" course into "Course 2" course using this options:
      | Initial | Include activities and resources | 1 |
      | Initial | Create empty sections            | 0 |
      | Schema  | Topic 1                          | 0 |
      | Schema  | Topic 2                          | 1 |
      | Schema  | Topic 3                          | 0 |
      | Schema  | Topic 4                          | 1 |
      | Schema  | Topic 5                          | 0 |
      | Schema  | Topic 6                          | 1 |
    And I should see "Test assignment name 2" in the "#section-2" "css_element"
    And I should see "Test assignment name 4" in the "#section-3" "css_element"
    And I should see "Test assignment name 6" in the "#section-4" "css_element"