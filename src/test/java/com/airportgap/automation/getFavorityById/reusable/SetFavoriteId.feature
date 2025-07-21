Feature: Set favoriteId in source foldder

Scenario:
  * def favoriteIdStr = favoriteId + ''
  * print 'Saving favoriteId:' , favoriteIdStr

  # call Java Function to write actual  src/test/java path
  * eval Java.type('util.FileWriterUtil').saveFavoriteId('src/test/java/data/favoriteId.json', favoriteIdStr)
  * eval Java.type('util.FileWriterUtil').saveFavoriteId('src/test/java/com/airportgap/automation/getFavorityById/data/favoriteId.json', favoriteIdStr)
  
 
