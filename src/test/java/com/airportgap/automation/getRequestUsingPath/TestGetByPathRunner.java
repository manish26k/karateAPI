package com.airportgap.automation.getRequestUsingPath;

import com.intuit.karate.junit5.Karate;

public class TestGetByPathRunner {

   @Karate.Test
    Karate runGetUsingPathVariable(){
        return Karate.run("getRequestById01").relativeTo(getClass());
    }
}
