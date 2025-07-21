Feature: load favorite id from module and globally

Scenario: loading favorites id's from module and global
    # module-specific path
    * def favdata = read('classpath:com/airportgap/automation/getFavorityById/data/favoriteId.json')
    * def favoriteId = favdata.favoriteId

    # global path
    # * def favdata = read('classpath:data/favoriteId.json')
    # * def favoriteId = favdata.favoriteId
