

# Sweater Weather
#### Created by: [Corina Allen](https://github.com/StarPerfect)

## Contents
 * [About](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#about-the-project)
 * [Endpoints](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#endpoints)
 * [Local Setup](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#local-setup)
 * [Testing Suite](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#testing-suite)
 * [Running Application](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#running-application)
 * [Tech](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#tech)

## About the Project

* [Project Requirements](https://backend.turing.io/module3/projects/sweater-weather)

* [GitHub Project Board](https://github.com/StarPerfect/sweater-weather/projects/1)

 Sweater Weather is a solo project over five days to showcase API consumption and re-exposure. It combines data from the following API's: Google Geocode for location information, Google Directions for road trip details, Unsplash for background images, DarkSky for forecasts, and Amypode for a location's antipode. The application utilizes authorization and authentication through a Postgres database with hashed passwords and API token generation.

## Endpoints

 * [Root](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#root)
 * [Local Weather](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#local-weather)
 * [City Background Image](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#city-background-image)
 * [Create User Account](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#create-user-account)
 * [Login User](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#login-user)
 * [Road Trip](https://github.com/StarPerfect/sweater-weather/blob/master/README.md#road-trip)

### Root
Application address

``` https://sweater-weather-1906.herokuapp.com/```

### Local Weather
Returns current weather and forecast for location

``` GET /api/v1/forecast?location=denver,co```

```location```: desired city location with state or country

[View Example](https://sweater-weather-1906.herokuapp.com/api/v1/forecast?location=denver,co)
### City Background Image

  Returns random nature image associated with the city provided

  ``` GET /api/v1/backgrounds?location=denver,co```

  ```location```: Desired city location with state or country

  [View Example](https://sweater-weather-1906.herokuapp.com/api/v1/backgrounds?location=denver,co)

### Create User Account

  Creates a user with valid emails and password matching password confirmation

  If successful, will return user's API key and 200 status

  ```POST /api/v1/users```

  ``` body
    {
     "email": "whatever@example.com",
     "password": "password",
     "password_confirmation": "password"
     }
  ```

  ```email```: Must be valid email not already used by another user

  ```password```: Desired password

  ```password_confirmation```: Must match password

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/3d29b4fe46034ec17dc7)

### Login User

  Logins in user with correct password

  If successful, will return user's API key and 200 status


  ```POST /api/v1/sessions ```

  ``` body
    {
     "email": "whatever@example.com",
     "password": "password",
     }
  ```

  ```email```: Must match email used to create account

  ```password```: Must match password used to create account

  [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/994f78a044c284e5f009)

### Road Trip

  Returns details for road trip including travel time and weather at destination

  Must include valid API key

  If successful, will return details for road trip and status 201


  ``` POST /api/v1/road_trip ```

  ``` body
    {
      origin: "Denver,CO",
      destination: "Pueblo,CO",
      api_key: "YOUR_API_KEY"
     }
  ```

  ```origin```: Starting city with state or country

  ```destination```: Ending city with state or country

  ```api_key```: Valid API key given to user when account created

  [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/2efa90a791e698cc7bc3)

## Local Setup

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Set up the database
```
$ rake db:create
$ rake db:migrate
```

Add the following API Key to your `application.yml` file

```
GOOGLE_API_KEY: your_google_key
DARKSKY_API_KEY: your_darksky_key
AMYPODE_API_KEY: oscar_the_grouch
UNSPLASH_ACCESS_KEY: your_unsplash_key
```
  Where to get API Keys
   * [Google](https://developers.google.com/maps/documentation/javascript/get-api-key)
   * [Dark_Sky](https://darksky.net/dev)
   * [Unsplash](https://unsplash.com/developers)

## Testing Suite
Run the test suite:
```
$ rspec
```

## Running Application
Run application locally:
```
$ rails s
```
- Visit `http://localhost:3000/` in Chrome browser
- Add desired endpoint to localhost address

## Tech

### Gems
* [figaro](https://github.com/laserlemon/figaro)
* [faraday](https://github.com/lostisland/faraday)
* [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.12)
* [fast_jsonapi](https://github.com/Netflix/fast_jsonapi)

### Versions
* Ruby 2.6.3
* Rails 5.2.3
