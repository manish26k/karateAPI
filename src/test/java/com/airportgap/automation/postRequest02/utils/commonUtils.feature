Feature: Common reusable methods for API requests

  Scenario: Perform a generic POST request
    * def postApiCall =
      """
      function(endpoint, payload, headers) {
        var config = {
          url: endpoint,
          headers: headers,
          method: 'POST',
          body: payload
        };
        return karate.callSingle(config);
      }
      """
