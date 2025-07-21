package com.airportgap.automation.getFavorityById;

import com.intuit.karate.junit5.Karate;

public class GetFavoriteRunner {

    @Karate.Test
    Karate runGetFavorite(){
        System.setProperty("karate.env", "dev");
        return Karate.run("GetFavoriteAirportById").relativeTo(getClass());
    }
    
}
