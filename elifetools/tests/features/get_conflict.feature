Feature: Parse the conflict tags from the article
  In order to use the conflict of interest details of this article
  as a script 
  I will read the conflict footnotes

  Scenario Outline: Read the conflict footnotes
    Given I have the document <document>
    And I have the index <idx>
    When I get the conflict
    Then I see the conflict <conflict>

  Examples:
    | document                  | idx      | conflict   
    | elife00013.xml            | 0        | JC: Reviewing Editor, eLife.
    | elife00013.xml            | 1        | The remaining authors have no competing interests to declare.
    