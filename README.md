# MS Exercise

A mini project that retrieves data and assets from [contentful](https://contentful.com).
This service shows an overview of recipes and their details.  


## Getting started
In order to start this project there are some steps to be done

### Requirements
* docker
* id and token from contentful

### Export ENV VARIABLES

You need to export these environment variables in order to build and deploy this service.
These values contains example values:

| env             | value       | explanation               |
|-----------------|-------------|---------------------------|
| RAILS_ENV       | production  | environment of deployment |
| SPACE_ID        | '1356423'   | Contentful ID             |
| ACCESS_TOKEN    | '135453453' | Contentful Token          |
| SECRET_KEY_BASE | '135453453' | Random Generated Key      |

### Building Docker image
for testing or development run:
```bash
  docker build -t ms-exercise .
```

for production release run:
```bash
  docker build -t ms-exercise:release_tag . --build-arg RAILS_ENV=$RAILS_ENV --build-arg SECRET_KEY_BASE=$SECRET_KEY_BASE --build-arg BUNDLE_ARGS='--without development test'
```

### Starting the service
To start this service on port 3000:
```bash
  docker run -p 3000:3000 -t --env SPACE_ID --env ACCESS_TOKEN --env RAILS_ENV --env SECRET_KEY_BASE --env RAILS_SERVE_STATIC_FILES=true ms-exercise
```
__note:__ if you build this project with passenger & nginx or something alike that can handle the assets you can remove ```RAILS_SERVE_STATIC_FILES``` 

### Running Tests
```bash
  docker run -i --rm --env SPACE_ID --env ACCESS_TOKEN ms-exercise bundle exec rspec
```

