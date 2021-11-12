# Project: Fakebook - Minimalistic Social Network


This is a project for Rails in the Ruby on Rails part of the main curriculum for [Microverse](https://www.microverse.org/) - @microverseinc
* The goal is to build a facebook like site.  
* The project was completed using Ruby on Rails, HTML and CSS.

#### [Assignment link](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)

#### [ER Digram](https://www.lucidchart.com/invitations/accept/47045662-2d3c-48cd-9ffd-21d4b66c9064)

#### [View live in broswer](https://microbook.herokuapp.com/)

#### Requirements

    Ruby 2.6.3

#### Installation

Download repository to your local machine, then run
   
    bundle install

#### Database

The project runs on PSQL. For running this application you must have a default PSQL role WITH LOGIN CREATEDB
For altering or creating a PSQL role run the following commands in postgres console
   
      For Creating a User:
      postgres=# CREATE ROLE role_name WITH LOGIN CREATEDB;
      
      For Altering Existing User
      postgres=# ALTER ROLE "role_name" WITH LOGIN CREATEDB;
      
    
#### Running

Run:

    rails server

### Rspec
    To run rspec at terminal:
      rspec
    
#### Authors

* [@lilleonz](https://github.com/lilleonz)
* [@eapenzacharias](https://github.com/eapenzacharias)
