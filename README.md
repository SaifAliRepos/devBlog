# README

* Name: DevBlog

* Description: App designed for users who love to post a blogs
where they can share their views, comments, likes, suggestions and much more.
It's not only limited to blog posting but includes diverese functionality and also provides authorization and priavcy policies, So that you can enjoy blogging while keeping it secure.
App is web-based and built by using ROR on backend and Bootsrap on frontend.
For now it cab be taken as a light instagram but in future we will ehance its functionalities.

* Modules of app: User, Post, Comments, Likes, Suggestions, Replies

* User roles: Admins, Moderators and Users

* Admin have all the rights except publishing or unpublishing post

* Moderator can publish or unpublish post and can delete it as well

* Registered user can post, comment, like, report and reply on published post.

* Unregistered user can only view published posts on home page of app.

* Sections in app: Home Section, Authorized User Section, Moderator Section, Admin Section

* Following are system dependencies

Rails 5.2.3 or higher
ruby 2.7.0
pg = 1.1

* Services

Action Mailer

Cloudinary

Postgress

* Gems

gem 'byebug', '~> 9.0', '>= 9.0.6'
gem 'cloudinary'
gem 'devise', '~> 4.8'
gem 'image_processing', '~> 1.2'
gem 'pundit'
gem 'rails_admin', '~> 3.0.0.rc4'
gem 'sassc-rails'

* How to install and run: Clone this repo and run bundle install to setup all gems after that setup your account on cloudinary. In clude your secret keys, api etc in cloudinary.yml file once its up you can run rake db:migrate to create tables and then rake db:seed for seeding the default values. After that run your local server and post the blogs!


* Credits: I want to thank google, stackoverflow and every single indivdual to guide me to acheive this objective.
