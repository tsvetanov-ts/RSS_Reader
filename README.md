# README

## Ruby on Rails RSS Reader

This reader was made using ruby 2.6.5 and rails 6.0.2

### RSS Reader setup

1. Clone master branch

2. Switch to ruby 2.6.5 (rbenv users can run  `rbenv local 2.6.5` and install it if necessary with `rbenv install 2.6.5`)

3. Set up your POSTGRES credentials (config/database.yml)

4. Type `bundle install` to install dependencies

5. Fire up rails dev server by `rails s`

6. Fire up redis: type `redis-server` command

7. Fire up sidekiq: type `bundle exec sidekiq`

8. Run rspec tests by typing `rspec`