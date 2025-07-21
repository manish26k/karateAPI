package com.airportgap.automation.runner;

import com.intuit.karate.junit5.Karate;

public class TokenWithMultiplePayloadsRunner {

    @Karate.Test
    Karate runTokenApi() {
        return Karate.run("../postRequest02/TokenWithMultiplePayloads").relativeTo(getClass());
    }
}
