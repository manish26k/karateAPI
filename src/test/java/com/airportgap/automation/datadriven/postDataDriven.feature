Feature: Generate Token API - Data Driven with CSV and Reusable Structure

  Background:
    * def endpoint = 'https://airportgap.com/api/tokens'
    * def schema = read('schemas/tokenSchema.json')
    * def saveResponse =
      """
      function(response, outputFile) {
        var Files = Java.type('java.nio.file.Files');
        var Paths = Java.type('java.nio.file.Paths');
        var outputDir = Paths.get('src/test/java/com/airportgap/automation/datadriven/output');
        if (!Files.exists(outputDir)) Files.createDirectories(outputDir);

        var jsonString = JSON.stringify(response, null, 2);
        var outputPath = outputDir.resolve(outputFile);
        Files.write(outputPath, jsonString.getBytes('UTF-8'));
      }
      """

  @DataDriven @POST
  Scenario Outline: Generate Token API - Validate response and Save token - <InputStatus>
    * def inputStatus = '<InputStatus>'
    * def email = '<Email>'
    * def password = '<Password>'
    * def expectedStatus = <StatusCode>
    * def outputFile = '<OutputFile>'

    * url endpoint
    * headers { 'Content-Type': 'application/json' }
    * def payload = { email: '#(email)', password: '#(password)' }
    * request payload
    * method POST
    #* status expectedStatus

    * match responseStatus == expectedStatus

    * print 'Raw Response:', response

    * eval
      """
      if (expectedStatus == 200) {
        var matchResult = karate.match(response, schema);
        if (!matchResult.pass) {
          karate.fail('Schema validation failed: ' + matchResult.message);
        }
        var token = response.token;
        karate.log('Extracted Token:', token);
        saveResponse({ token: token }, outputFile);
      } else {
        saveResponse(response, outputFile);
      }
      """

    Examples:
      | read("Paylaod.csv") |
