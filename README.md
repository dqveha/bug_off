# Bug Off! (Bug/Issue Tracking System)
---
### https://github.com/dqveha/bug_off
---
### By Dave Lindqvist
---
## Description
Project's intention: An internal software/web application that keeps track of bugs, similar to an issue tracking system. An example is like JIRA (https://www.atlassian.com/software/jira) or ClickUp (https://clickup.com/blog/jira-alternatives/).

## Setup and Use
1. Ruby is required. Download and install using these instructions: https://www.ruby-lang.org/en/documentation/installation/
2. Install bundler in the terminal with `gem install bundler`
3. Ensure PostgreSQL is installed
4. Setup where you would like to clone the repo in the terminal and type `git clone https://github.com/dqveha/bug_off.git`
5. At the correct directory, run `bundle install` in the terminal
6. Run `rake db:create`, then `rake db:migrate`, and lastly, `rake db:seed`
7. Run the site by entering `rails s` in the terminal
8. Navigate to `localhost:3000` for the website
9. A default admin account should be seeded. Login with `email: dave@gmail.com, password: password` 
10. To change roles of users, click `Manage Accounts` in the sidebar, click edit, then update the role of the specific user.
## MVP
* Assign bug tickets to support user accounts
* Allow user to enter bug ticket through a form and populate on their index page.
* Have user authentication and admin management page

## Technologies/Tools
* Ruby/Rails
* PostgreSQL
* Faker
* ChartKick
* Kaminari
## Stretch Goals Achieved

* Set up charts on dashboard homepage for all users with respect to their role
* Set up paper_trail gem for historical documentation of issue changes
* Set up a many-to-many association (Bug Tickets <-> Users); One-to-many (Project -> Bug Tickets)
* Rails' active storage feature to upload pictures
* Pagination via Kaminari

## Future Plans of Additions/Changes/Improvements
* Implement a chat function or message system so that users can interact with each other about the bugs in real-time or with timestamps
* After tickets are closed, emails are sent to the user to confirm it’s fixed. Other emails would be sent to workers if they’re assigned a new ticket to work on.
* User notifications and updates
* Search functions
* Better distinction for changes and updates of ticket
Stretch goals shown above
* More details + legend for charts
* Depending on the category of the ticket sent, changes the form questions
* Review process where lead/admin checks work by support and closes it out
* DRY + Refactoring
* Accepting more than image files (current settings only accepts JPEG or PNG )
* Deploy website to Heroku with AWS setup
* TDD with coverage and integration testing
* React UI

## License is under the MIT License. Copyright (C) 2021 Dave Lindqvist. All Rights Reserved.

```
MIT License

Copyright (c) 2021 Dave Lindqvist

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
