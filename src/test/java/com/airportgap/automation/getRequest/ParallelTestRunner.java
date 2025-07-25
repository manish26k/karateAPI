package com.airportgap.automation.getRequest;

import com.intuit.karate.junit5.Karate;

public class ParallelTestRunner {

    @Karate.Test
    Karate testAll(){
        System.setProperty("karate.output.dir", "target/karate-reports");
        return Karate.run()
                .relativeTo(getClass())
                .outputCucumberJson(true)
                .outputJunitXml(true);

    }
    
}
