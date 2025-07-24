package com.airportgap.automation.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;



public class TestGetRunner {
    @Test
    public Karate runTest(){
        System.setProperty("karate.output.dir", "target/karate-reports");
        // return Karate.run("getAirports")
        return Karate.run()
                     .relativeTo(getClass())
                     .outputCucumberJson(true)
                     .outputJunitXml(true);
                     
    }
}
