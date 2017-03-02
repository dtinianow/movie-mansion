# Movie Mansion

## Overview

[Movie Mansion](https://movie-mansion.herokuapp.com/) is a simple web application built with Rails 5.0.1.  The goal of this project was to build a website for a movie theater so it can sell tickets online.

### Live Version

You can find a live version of this application hosted on Heroku [here](https://movie-mansion.herokuapp.com/).

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `git clone https://github.com/dtinianow/movie-mansion`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `bundle exec rake db:{create,migrate,seed}` to set up the postgres database and seed it.
  5. Run the application in the dev environment by running `rails s`
  6. Visit `http://localhost:3000/`

### Features

#### Booking a Showtime

The main purpose of the site is allow users to book a movie showtime.  A user can purchase one ticket for a showtime. Once a user places an order, a confirmation email is sent to them.

A user can search for movies and showtimes on a specific date by entering the date as a parameter in the URL, like so: `https://movie-mansion.herokuapp.com/showtimes?date=mm/dd/yyyy`.  If a user does not enter a date in the URL, the site will default to showing today's movie listings.

Note: Do NOT enter your real credit card information!  The system will validate that the number you enter is legitimate, but it is not secure!

#### Admin

The site gives the admin the ability to manage existing auditoriums, create new auditoriums, create new movies, view all orders completed, and view all orders made for a specific movie.  Adding the ability to manage showtimes is a work in progress.  Currently, there is no authentication, so a user simply needs to visit https://movie-mansion.herokuapp.com/admin to gain access to these admin capabilities.


### Test Suite

The test suite tests the application on multiple levels. To run all of the tests, run `rspec` from the terminal in the main directory of the project. The feature tests (integration tests) rely mainly on the [capybara gem](https://github.com/jnicklas/capybara) for navigating the various application views.

### Dependencies

This application depends on many ruby gems, all of which are found in the `Gemfile` and can be installed by running `bundle install` from the terminal in the main directory of the project.

### Approach

I began to build this application by first laying out a database schema using [this website](https://ondras.zarovi.cz/sql/demo/).  I then drew out rough wireframes for the most important pages of the application.  Once that was complete, I used TDD to build out the application's functionality.  I broke down each of the requirements listed into a user story that could be written as a feature test. Once the test was written, I followed the errors it gave me to help build out the feature.  

I tried to adhere to the single responsibility principle and notion of skinny controllers/fat models. After getting each feature to work, I would refactor whenever possible. There is still plenty of room for refactoring in the application, as well as many edge cases that demand a closer look. This is the first and most simple iteration of the application.
