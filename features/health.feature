Feature:
   API should expose health endpoint

  Scenario: Verify health endpoint
    When I GET health endpoint
    Then API responds with code 200
    And Response matches 'get_health' pattern