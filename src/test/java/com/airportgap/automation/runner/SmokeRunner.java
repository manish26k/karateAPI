package com.airportgap.automation.runner;

import com.intuit.karate.junit5.Karate;

public class SmokeRunner {

    @Karate.Test
    Karate runSmoke(){
        return Karate.run("../postRequest02/TokenWithMultiplePayloads01").tags("@Smoke").relativeTo(getClass());
    }
}
