@iPlayerNavigation
Feature: Navigation to BBC iPlayer page
  As a user
  I should be able to navigate to BBC iPlayer page from BBC Home Page

  Scenario: Navigate to BBC iPlayer Page
    Given I am on BBC Home Page
    When I click on BBC iPlayer from menu
    Then I am navigated to BBC iPlayer page
