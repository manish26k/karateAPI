package com.airportgap.automation.getRequestUsingPath;

import com.intuit.karate.junit5.Karate;

public class TestGetByPathRunner01 {

   @Karate.Test
    Karate runGetUsingId(){
        System.setProperty("karate.env", "dev");
        return Karate.run("getRequestById02").relativeTo(getClass());
    }
}
