Feature: guess invalid letter

  As a player playing Hangperson
  So that I can make progress toward the goal
  I want to see if i made an invalid move

Scenario: guess invalid letter 

  Given I start a new game with word "garply"
  When I guess "8"
  Then the word should read "------"
  And I should see "Invalid guess."
