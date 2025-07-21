package com.airportgap.automation.datadriven;

import com.intuit.karate.junit5.Karate;

public class TestDataDrivenRunner {

    @Karate.Test
    public Karate runTest(){
        return Karate.run("postDataDriven").relativeTo(getClass());
    }
}
