Feature: Generate Token API with reusable, maintainable, optimized structure-02

  Background:
    * def utils = call read('utils/commonUtils.feature')
    * def schema = read('schemas/tokenSchema.json')
    * def endpoint = 'https://airportgap.com/api/tokens'
    * def headers = { 'Content-Type': 'application/json' }
    * def saveToken =
      """
      function(token) {
        var Files = Java.type('java.nio.file.Files');
        var Paths = Java.type('java.nio.file.Paths');
        var outputDir = Paths.get('src/test/java/com/airportgap/automation/output');
        if (!Files.exists(outputDir)) Files.createDirectories(outputDir);
        var outputPath = outputDir.resolve('tokenResponse.json');
        var jsonString = JSON.stringify({ token: token });
        Files.write(outputPath, jsonString.getBytes('UTF-8'));
      }
      """

  @Smoke @Positive
  Scenario Outline: Generate Token with multiple payloads, validate response, save token
    * def payload = read('<payloadPath>')
    * url endpoint
    * headers headers
    * request payload
    * method POST

    * match responseStatus == <expectedStatus>
    * print 'Raw Response:', response

    # For positive cases, validate schema & save token
    * eval
    """
    if (expectedStatus == 200){
      var isMatch = karate.match(response, schema);
      if (!isMatch.pass){
        karate.fail('Schema validation failed: ' + isMatch.message);
      }
      var token = response.token;
      print('Extracted Token:', token);
      saveToken(token);

    }
    """
    Examples:
      | payloadPath                            | expectedStatus |
      | payloads/tokenPayload.json             | 200            |
      | payloads/tokenPayloadEmpty.json        | 401            |
      | payloads/tokenPayloadInvalid.json      | 401            |