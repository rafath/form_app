# README

## Calltracks Test

### Requirements
Ruby v 3.0.2
Rails: v 7.0.4

Rename .env.sample to .env and add your credentials do postgresql database.

To install the project run:
* `bundle install`
* `rake db:create`
* `rake db:migrate`
* `yarn install`

Then you can run the server with `./bin/dev` and visit [localhost:3000](http://localhost:3000) to see the app in action.

if page does not look like the screenshot, then something went wrong...

![](tmp/preview.png)

### Tests
You can run the tests with `rspec` and also `yarn test`

Additional methods are placed in `ApplicationHelper` and js sum method in the `app/javascript/calculator.js` file.

### SQL Queries for salaries:

`select employee_id, max(amount) from salaries group by employee_id;`

`select organisation_id, avg(amount) from salaries group by organisation_id;`

Have Fun!
