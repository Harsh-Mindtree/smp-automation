@ParentalWindowMobile
Feature: Verify Parental Window
  As a user
  I should see Parental Window for contents that are rated as G

  Background: User should see Guidance window when playing any PG rated content
    Given I am on BBC HTML5 page
    And I choose to "Opt in to the HTML5 Player"
    And I should see "Opt out of the HTML5 Player" button enabled
    And I am on BBC iPlayer page
    And I select any PG rated content
    And I choose "I have a TV Licence" option
    And I click on Play CTA
    And I see "Guidance" Window

  @AgeConfirmationError @android
  Scenario: User should verify Age before playing the content
    When I "do not" check Age verification Checkbox
    And I click on "Continue" button
    Then I should see "Please confirm your age before continuing" warning

  @PlayWithoutPG @android1
  Scenario: Playback should resume when user choose to Play without PG
    When I "do" check Age verification Checkbox
    And I click on "Continue" button
    And I see "Parental Guidance Lock" Window
    And I choose "Play without PG Lock" option on Parental Window
    Then Playback video should get started

  @IncorrectPGPin @android1
  Scenario Outline: User should not be allowed to enter empty/invalid Parental PIN
    When I "do" check Age verification Checkbox
    And I click on "Continue" button
    And I see "Parental Guidance Lock" Window
    And I choose "Turn on PG Lock" option on Parental Window
    And I enter "invalid" <Guidance Pin>
    And I click on "Play" button
    Then I should see "Your PIN must be four digits long." warning

    Examples: 
      | Guidance Pin |
      |              |
      | 123          |
      | 12!@         |
      | qwer         |

  @CorrectPGPin @android1
  Scenario Outline: Playback should resume when user set valid PG Pin
    When I "do" check Age verification Checkbox
    And I click on "Continue" button
    And I see "Parental Guidance Lock" Window
    And I choose "Turn on PG Lock" option on Parental Window
    And I enter "valid" <Guidance Pin>
    And I click on "Play" button
    Then Playback video should get started

    Examples: 
      | Guidance Pin |
      | 1234         |
