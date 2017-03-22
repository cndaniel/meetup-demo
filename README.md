# README

A complete demo of meetups with web and apis with Test-Driven-Development approach

a TA-reference solution for quanzhanying interview question 5

## Specs

 1. User can signup, sign in, log out (including feature test)
 2. User can create meetups and read meetup lists (including controller and mini test)
 3. User can post comments under each meetup. (Ajax and JS front-end comment layout and posting )
 4. Api: public, get "meetups"; authorization with token based auth; required auth_token for get "meetups/:id" (rpsec api test included)



## requirements
 * ruby 2.3.1
 * rails 5
 * rspec 3.5.4


## Installation(local)
```
   $ git clone git@github.com:cndaniel/meetup-demo-api.git
   $ cd enrollment-api
   $ bundle install
   $ bundle exec rake db:create
   $ bundle exec rake db:migrate
   $ bundle exec rspec --format documentation
```
## Manual Testing
  Web-demo: https://meetup-demo.herokuapp.com
  api testing with postman or command line:
  
  1.sign up
  ```
  curl -X POST -F "email=cndaniel1@me.com" -F "password=12345678" "https://meetup-demo.herokuapp.com/api/v1/signup"
  ```

  2. log in to get auth token and take note of it
  ```
    curl -X POST  -F "email=cndaniel1@me.com" -F "password=12345678" "https://meetup-demo.herokuapp.com/api/v1/login"
  ```
  3. get a specific meetup list  with auth token:
```
  curl -X GET -H "Authorization: Token token=yxQQF6kbHaExsZAAjB99" \
 "https://meetup-demo.herokuapp.com/api/v1/meetups/1"
 ```
