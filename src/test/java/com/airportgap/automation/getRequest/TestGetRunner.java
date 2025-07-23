package com.airportgap.automation.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;



public class TestGetRunner {
    @Test
    public Karate runTest(){
        return Karate.run("getAirports")
                     .relativeTo(getClass())
                     .outputCucumberJson(true)
                     .reportDir("target/karate-reports");
    }
}
