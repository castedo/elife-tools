Feature: get authors from the document
  In order to put my author names in my api
  as a script 
  I will parse the authors from the xml file
  
  Scenario Outline: Count the number of authors
    Given I have the document <document>
    When I count the number of authors 
    Then I count the total authors as <authors>
  
  Examples:
    | document                    | authors
    | elife-kitchen-sink.xml      | 10       
    | elife00013.xml              | 8       

  Scenario Outline: Get authors
    Given I have the document <document>
    When I get the authors
    Then I see author index <idx> <attribute> <sidx> as <val>
  
  Examples:
    | document                    | idx | attribute              | sidx | val
    | elife-kitchen-sink.xml      | 0   | person_id              |      | 23
    | elife-kitchen-sink.xml      | 0   | surname                |      | Alegado
    | elife-kitchen-sink.xml      | 0   | given_names            |      | Rosanna A
    | elife-kitchen-sink.xml      | 0   | country                | 0    | United States
    | elife-kitchen-sink.xml      | 0   | institution            | 0    | University of California, Berkeley
    | elife-kitchen-sink.xml      | 0   | department             | 0    | Department of Molecular and Cell Biology
    | elife-kitchen-sink.xml      | 0   | city                   | 0    | Berkeley
    | elife-kitchen-sink.xml      | 0   | country                | 1    | United States
    | elife-kitchen-sink.xml      | 0   | institution            | 1    | Harvard Medical School
    | elife-kitchen-sink.xml      | 0   | department             | 1    | Department of Biological Chemistry and Molecular Pharmacology
    | elife-kitchen-sink.xml      | 0   | city                   | 1    | Boston
    | elife-kitchen-sink.xml      | 0   | author                 |      | Rosanna A Alegado
    | elife-kitchen-sink.xml      | 0   | notes_correspondence   |      | None
    | elife-kitchen-sink.xml      | 6   | notes_correspondence   |      | * For            correspondence: jon_clardy@hms.harvard.edu (JC);
    | elife00013.xml              | 6   | notes_correspondence   |      | * For correspondence: jon_clardy@hms.harvard.edu (JC);
    | elife00013.xml              | 0   | notes_footnotes        | 0    | † These authors contributed equally to this work
    | elife00013.xml              | 0   | notes_footnotes        | 1    | RA: Conception and design, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article
    | elife00013.xml              | 0   | notes_footnotes        | 2    | The remaining authors have no competing interests to declare.
    | elife00013.xml              | 0   | article_doi            |      | 10.7554/eLife.00013
    | elife00013.xml              | 0   | position               |      | 1