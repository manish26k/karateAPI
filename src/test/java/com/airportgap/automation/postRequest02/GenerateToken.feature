Feature: Generate Token API with reusable and maintainable approach

  Background:
    * def utils = call read('utils/commonUtils.feature')
    * def payload = read('payloads/tokenPayload.json')
    * def schema = read('schemas/tokenSchema.json')
    * def endpoint = 'https://airportgap.com/api/tokens'
    * def headers = { 'Content-Type': 'application/json' }

  Scenario: Generate Token, Validate response and Save token
    * url endpoint
    * headers headers
    * request payload
    * method POST
    * status 200

    # Debug to verify raw response
    * print 'Raw Response:', response

    # Validate response schema
    * match response == schema


    # Parse response safely
    * def responseJson = eval (response)
    * def token = responseJson.token
    * print 'Extracted Token:', token

    # Save token to output file safely
    * def Files = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')
    * def outputDir = Paths.get('src/test/java/com/airportgap/automation/postRequest02/output')
    * if (!Files.exists(outputDir)) Files.createDirectories(outputDir)
    * def outputPath = outputDir.resolve('tokenResponse.json')
    * def content = { token: token }
    * def jsonString = '{ "token": "' + token + '"}'
    * Files.write(outputPath, jsonString.getBytes('UTF-8'))

