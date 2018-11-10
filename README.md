# public_api_querier

[![Build Status](https://travis-ci.org/DaveLawes/public_api_querier.svg?branch=master)](https://travis-ci.org/DaveLawes/public_api_querier)

This is a command line Ruby app that queries a public api and returns answers to three hard-coded questions. 

## How to Use

#### How to Install

The application was built using Ruby 2.5.1 and this Ruby version is specified as part of the build.

Fork or clone this repo to your local machine. Run `bundle install` to make sure all gemfiles (dependencies) are correctly installed.

#### How to Test

From the root of the project directory run `rspec` - this will run all feature and unit tests.

Note: feature tests make calls to the API whereas the unit tests are isolated and do not make calls to the API.

#### How to Run

From the root of the project directory invoke the following commands in the command line:

- To get an answer for the most sold question: `ruby app.rb most_sold`
- To get an answer for the total spend question: `ruby app.rb total_spend [EMAIL]`
- To get an answer for the most loyal question: `ruby app.rb most_loyal`

## Requirements

Extracted requirements:
- Provide documentation about the design
- Explain my thought process
- Provide information about how to run and test my app
- Write simple and readable code
- Split the app across multiple files
- Provide meaningful (passing) tests
- Dealing with edge cases are a bonus

## User Stories

The requirements above translated into the following user stories:

```
As a user
So I can provide more detailed information to my client
I'd like the app to return the most sold item

As a user
So I can provide more detailed information to my client
Given a user's email address, I'd like the app to return their total spend

As a user
So I can provide more detailed information to my client
I'd like the app to return the most loyal customer
```

Some identified edge cases:

```
As a user
So I get more information about the app
I'd like to receive feedback if an unknown question is asked

As a user
So I get more information about the question result
I'd like to receive feedback if the total_spend email isn't included in the data

As a user
So I get more information from the app
I'd like to receive feedback if there is an error with the HTTP response
```

## Domain Model

```
╔════════════╗  
║             ║ Instantiates an instance of the Question class
║   app.rb    ║ Invokes method corresponding to question asked     
║             ║ Returns answer to user
╚════════════╝
       |
       |
       |
       |                (Class)
       |            ╔════════════╗
       |            ║             ║ Instantiates a new instance of the QueryApi class
       |------------║   Question  ║ Manipulates data received from API
                    ║             ║ Returns answer to app.rb
                    ╚════════════╝
                           |
                           |
                           |               (Class)              
                           |            ╔════════════╗     
                           |            ║             ║ Queries API  
                           |------------║  QueryApi   ║ Returns data to Question class
                                        ║             ║    
                                        ╚════════════╝ 
                                         
```

## Design and Thought Process

The following describes my steps when creating the solution:
- Read the requirements and ensure I have understood them
- Create user stories for core requirements and edge cases
- Create domain model (having thought about what classes and architecture I want)
- Setup my project (github repo, TravisCI, rubocop, simplecov)
- Follow a red-green-refactor flow (starting with a feature test for my first user story)
- If edge cases are identified when working: add these as features/user stories to be completed after all core user stories have been satisfied

## Areas for Improvement
