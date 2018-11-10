# public_api_querier

[![Build Status](https://travis-ci.org/DaveLawes/public_api_querier.svg?branch=master)](https://travis-ci.org/DaveLawes/public_api_querier)

This is a command line Ruby app that queries a public api and returns answers to three hard-coded questions. 

## How to Use

#### How to Install

#### How to Test

#### How to Run

## Requirements

Extracted requirements:
- Provide documentation about the design
- Explain my thought process
- Provide information about how to run and test my app
- Write simple and readable code
- App should be split across multiple files
- Provide meaningful (passing) tests
- Dealing with edge cases is a bonus

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
So I get more information about the API
I'd like to receive feedback if there is an error with the API status
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

## Areas for Improvement
