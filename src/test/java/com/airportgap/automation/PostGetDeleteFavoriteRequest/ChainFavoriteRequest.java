package com.airportgap.automation.PostGetDeleteFavoriteRequest;

import com.intuit.karate.junit5.Karate;

public class ChainFavoriteRequest {

    @Karate.Test
    Karate testFlow() {
        return Karate.run("ChainFavoriteRequest").relativeTo(getClass());
    }
    
}
