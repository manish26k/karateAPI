Feature: Test Token feature with multiple payloads

  Background:
    * def endpoint = 'https://airportgap.com/api/tokens'
    * def headers = { 'Content-Type': 'application/json' }
    * def schema = read('schemas/tokenSchema.json')
    * def Files = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')
    * def outputDir = Paths.get('src/test/java/com/airportgap/automation/postRequest02/output')
    * if (!Files.exists(outputDir)) Files.createDirectories(outputDir)

    # Save raw response to file for all scenarios
    * def saveResponse =
      """
      function(response, outputFile) {
        var Files = Java.type('java.nio.file.Files');
        var Paths = Java.type('java.nio.file.Paths');
        var outputDir = Paths.get('src/test/java/com/airportgap/automation/postRequest02/output');
        if (!Files.exists(outputDir)) Files.createDirectories(outputDir);

        var jsonString = JSON.stringify(response, null, 2);
        var outputPath = outputDir.resolve(outputFile);
        Files.write(outputPath, jsonString.getBytes('UTF-8'));
      }
      """

    # Define reusable saveToken function
    * def saveToken =
      """
      function(response, outputFile) {
        var schema = karate.read('schemas/tokenSchema.json');
        var Files = Java.type('java.nio.file.Files');
        var Paths = Java.type('java.nio.file.Paths');
        var outputDir = Paths.get('src/test/java/com/airportgap/automation/postRequest02/output');
        if (!Files.exists(outputDir)) Files.createDirectories(outputDir);

        var matchResult = karate.match(response, schema);
        if (!matchResult.pass) {
          karate.fail('Schema validation failed: ' + matchResult.message);
        }

        var token = response.token;
        karate.log('Extracted Token:', token);

        var jsonString = JSON.stringify({ token: token });
        var outputPath = outputDir.resolve(outputFile);
        Files.write(outputPath, jsonString.getBytes('UTF-8'));
      }
      """

  Scenario Outline: Generate Token, Validate response, Save token to file
    * url endpoint
    * headers headers
    * request <payload>
    * method POST
    * status <statusCode>

    * print 'Raw Response:', response

    * eval
      """
      if (<statusCode> == 200) {
        saveToken(response, <outputFile>);
      }else{
         saveResponse(response, <outputFile>);
      }
      """

    Examples:
      | payload                                   | statusCode | outputFile           |
      | read('payloads/tokenPayload.json')        | 200        | 'tokenResponse.json' |
      | read('payloads/tokenPayloadInvalid.json') | 401        | 'tokenInvalid.json'  |
      | read('payloads/tokenPayloadEmpty.json')   | 401        | 'tokenEmpty.json'    |
