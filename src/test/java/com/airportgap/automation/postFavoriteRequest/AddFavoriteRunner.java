package com.airportgap.automation.postFavoriteRequest;

import com.intuit.karate.junit5.Karate;

public class AddFavoriteRunner {

    @Karate.Test
    Karate runPostFavorite() {
        return Karate.run("AddFavorite").relativeTo(getClass());
    }
    
}
