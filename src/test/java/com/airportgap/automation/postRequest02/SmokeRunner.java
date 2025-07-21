package com.airportgap.automation.postRequest02;

import com.intuit.karate.junit5.Karate;

public class SmokeRunner {

    @Karate.Test
    Karate runSmoke(){
        return Karate.run("TokenWithMultiplePayloads01").tags("@Smoke").relativeTo(getClass());
    }

    
}
