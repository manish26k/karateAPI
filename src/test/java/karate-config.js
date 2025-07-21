function fn() {
  var env = karate.env || 'dev';
  karate.log('Running tests in environment:', env);

  var config = {
    env: env
  };

  // Define environment-specific baseUrl
  if (env === 'dev') {
    config.baseUrl = 'https://airportgap.com/api';
  } else if (env === 'qa') {
    config.baseUrl = 'https://qa.airportgap.com/api';
  } else if (env === 'prod') {
    config.baseUrl = 'https://prod.airportgap.com/api';
  }

  // Define common endpoints and defaults
  config.endpoints = {
    airportById: 'airports',
    addFavorite: 'favorites'
  };

  // Default auth token and POST body for Favorite
  config.authToken = 'token=qCYAo8DGQK9Wiyrx5VV7Rggg';
  config.defaultFavoriteBody = {
    airport_id: 'JFK',
    note: 'Chained test to POST → GET → DELETE → Confirm 404'
  };

  // Default Path Variable (can be overridden)
  config.defaultPathParams = {
    id: 'GKA'
    
  };

  // Default favorite Path Variable (can be overridden)
  config.defaultfavoritePathParams = {
    id: 36824
    
  };

  // Default Path Variable (can be overridden)
  config.defaultQueryParams = {
    latitude: '-6.08169',
    longitude: '145.391998'
  };

  config.defaultId = 'KIX'; // fallback path variable

  config.statusCodes = {
    success: 200,
    created: 201,
    badRequest: 400,
    unauthorized: 401,
    forbidden: 403,
    notFound: 404,
    serverError: 500,
    noContent: 204
  };

  return config;
}
