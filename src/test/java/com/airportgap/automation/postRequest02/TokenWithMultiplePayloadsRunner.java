package com.airportgap.automation.postRequest02;

import com.intuit.karate.junit5.Karate;

public class TokenWithMultiplePayloadsRunner {

    @Karate.Test
    Karate runTokenApi() {
        return Karate.run("TokenWithMultiplePayloads").relativeTo(getClass());
    }
    
}
