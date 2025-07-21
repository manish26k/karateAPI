package com.airportgap.automation.getRequestUsingQueryandPath;

import com.intuit.karate.junit5.Karate;

public class TestGetAirPortUsingQueryandPath {

    @Karate.Test
    Karate runGetUsingIdandQuery(){
        System.setProperty("karate.env", "dev");
        return Karate.run("GetAirportUsingQueryAndPath").relativeTo(getClass());
    }
    
}
