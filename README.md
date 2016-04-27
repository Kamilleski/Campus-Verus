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
