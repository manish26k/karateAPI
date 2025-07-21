package com.airportgap.automation.deleteFavoriteById;

import com.intuit.karate.junit5.Karate;

public class DeleteFavoriteRunner {

    @Karate.Test
    Karate runDeleteFavorite(){
        System.setProperty("karate.env", "dev");
        return Karate.run("DeleteFavorite").relativeTo(getClass());
    }
    
}
