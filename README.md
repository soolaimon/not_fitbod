### Host
https://dashboard.heroku.com/apps/lit-wave-88820

#### Access User Workouts
A list of a user’s workouts can be accessed via GET request to  `/users/:user_id/workoutes` endpoint.

*Example*
`curl https://lit-wave-88820.herokuapp.com/users/1/workouts`

A client can get a list of workouts it doesn’t know about yet by passing a the query_parameter  `created_since`  with its last known workout date.

*Example*
```curl https://lit-wave-88820.herokuapp.com/users/1/workouts\?created_since\=2021-03-16T04:55:45.070Z
```

#### Create Workouts
A workout can be created by sending a POST request with a JSON object to the `/users/:user_id/workouts` endpoint

*Example*:
```curl -d '{"workout": {"date": "2021-03-15T04:55:45.197Z", "duration": 90}}' -H 'Content-type: application/json' https://lit-wave-88820.herokuapp.com/users/1/workouts
```

#### Running Tests
`rails test`
