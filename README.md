# README

## Calltracks Test

### Requirements
Ruby v 3.0.2
Rails: v 7.0.4


Rename .env.sample to .env and add your credentials do postgresql database.

to install the project run:
* `bundle install`
* `rake db:create`
* `rake db:migrate`
* `yarn install`

Then you can run the server with `./bin/dev` and visit [localhost:3000](http://localhost:3000) to see the app in action.

## Tests
You can run the tests with `rspec` and also `yarn test`

Additional methods are placed in `ApplicationHelper` and js sum method in the `app/javascript/calculator.js` file.


Have Fun!
