# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Steps to follow

* First of all we need to setup devise (it is a gem that provides authorization facilities)

* You can Modify the default settings in config/initilizers/devise.rb

* For adding a custom field in devise i.e. we have added name column in devise model that is not provided by devise. We need to add it in our migration file and also permit it in apllication_controller.

* Once devise is setup we will deploy our ERD.

* Create them with rails scafollding to save time

* Made associations properly i.e. User has many posts, posts has many comments, comments has many replies etc.

* We declare associations in in model.rb file and we also need to specify rferences in our migration

* Add validations in model.rb files and handle dependencies there i.e. dependent should be destroyed if his parent is destroyed

* For user roles we also need to declare them with enum in model.rb files

* Scopes are also added in model.rb file that helps to custom query with DRY code

* We have also added helper for checking eligible user to keep views clean

* Partials were added to acheive DRY concept

* For attachements we need active storage install it. as we are using heroku and it requires cloud storage so we will be cloudinary service.

* Install cloudinary gem, make account on cloudinary and set active storage service to: cloudinary in storage.yml file

* Dont forget to add changes you made in production enviornment

* Also create a cloudinary.yml in locales/ where you can specify cloudinary settings like api_key and name etc for different enviornments

* We will be using UserMailer for sending mails.

* On heroku add confis vars that are master_key and secret_key etc.

* For rails admin we have used the gem rails_admin it provides all authorities to admin

* The user with role admin would be able to access it. We specified this in routes file


