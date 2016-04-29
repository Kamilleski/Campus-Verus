#Campus Verus

![Build Status](https://codeship.com/projects/247cce80-e26e-0133-9815-5e7bb9818a79/status?branch=master) 
![Coverage Status](https://coveralls.io/repos/kamilleski/Campus-Verus/badge.png)

Campus Verus is a college tour platform built with Ruby on Rails. Campus Verus was designed to provide honest fora for High School Students to visit colleges and glean useful information about their prospective futures. High School Students may search for schools based on a variety of factors, then select a College Student Guide at that institution who most closely fits their background/major/etc. Necessarily, this application also allows for College Student Guides to make a future difference in how their school is portrayed.

[Heroku Deployment](https://campus-verus.herokuapp.com/)

## Features
* College and High School Students have separate portals and profiles
* CSGs may update their profiles with additional information (worst restaurant on campus, etc.)
* Insider information is hidden from those without tourist accounts

## Technologies
* Login/Registration functionality implemented with [Devise](https://github.com/plataformatec/devise/wiki)
* Pagination added with the [Kaminari](https://github.com/amatsuda/kaminari) gem
* Feature testing with [Capybara](https://github.com/jnicklas/capybara)
* Model testing with [Rspec](http://rspec.info/)
* [Foundation](http://foundation.zurb.com/sites/docs/) as basis for styling
* Additional styling with [Parallax.js](https://github.com/wagerfield/parallax)
* API Calls to [New York Times](http://developers.nytimes.com/), [Google Maps](https://developers.google.com/maps/) for each school

## Site Navigation
* New visitors can browse schools either by paginating through them or using the fully-functioning search feature
* New visitors can see 'standard' information about every college, but only insider information once they create an account
* College students can tweak their profile to be more attractive and interesting to prospies
* Each college show page (once logged-in) attemps to show the realities of life at the school by dynamically showing: 
  * Google Campus map (with ratings and associated data)
  * Top New York Times stories related to that particular school
  * Real, current student opintions about their college experience thus far
* Logged-in tourists can navigate through school pages and select tour guides that meet their interests, then contact them and set up a time for a tour
* **HINT** Check out UC Berkeley's school page for some awesome seeded data. ;)
