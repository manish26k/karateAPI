package com.airportgap.automation.runner;

import com.intuit.karate.junit5.Karate;

public class TokenRunner {

    @Karate.Test
    Karate runTokenApi() {
        return Karate.run("../postRequest02/GenerateToken").relativeTo(getClass());
    }
}
