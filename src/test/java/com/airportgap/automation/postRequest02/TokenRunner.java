package com.airportgap.automation.postRequest02;

import com.intuit.karate.junit5.Karate;

public class TokenRunner {

    @Karate.Test
    Karate runTokenApi() {
        return Karate.run("GenerateToken").relativeTo(getClass());
    }
    
}
