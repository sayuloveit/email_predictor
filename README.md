# email_predictor
predict emails based name and domain

Run code:
  1. bundle
  2. ruby runner.rb

Run tests:
  1. rspec spec

Code Layout in lib:
  analyser.rb -- analyzes examples

  constants.rb -- contains example name and emails, emails to predict

  evaluater.rb -- figures out which patterns go with each domain using analyser

  generator.rb -- contains module to generate email prediction

  patterns.rb -- contains the 4 given email patterns

  predictor.rb -- generates the predicted email for given name and domain

Coded with Ruby 2.0.0p247