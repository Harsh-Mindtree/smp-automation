@iPlayerNavigationMobile
Feature: Navigation to BBC iPlayer Mobile page
  As a user
  I should be able to navigate to BBC iPlayer page from BBC Home Page on Mobile

  Scenario: Navigation to BBC iPlayer Page
    Given I am on BBC Home Page
    When I click on menu tab
    And I select "iPlayer"
    Then I am navigated to BBC iPlayer page
