#Not Allowed

__Skill Level:__ Intermediate  
__Time Limit:__ 1-2 hours

There are a number of authentication solutions that offer quick and somewhat painless user management with features such as encryption, email confirmation, and password reset. The object of this drill is to learn and use some of the underlying methods Rails provides to manage session, cookies & encryption. 

##Instructions
Update the `User` model and migration to handle both regular users and at least one administrator. Your controllers should support a few core actions:
  - Use Haml & SASS

###Functionality
1. Logging in
2. Logging out
3. Creating an account
4. Viewing the secret dashboard page for logged in users
5. Viewing a secret page for administrators 
6. Redirecting a user back to the "log in" screen if they try to view the secret page without being logged in
7. Redirecting a regular user back to their "dashboard" screen or prompting them with a `flash` message if they try to view the administrator page

__NOTE:__ Don't worry about populating your views with too much data just get down the basic functionality.

##Resources
- [Haml Docs](http://haml.info/)
- [Base#session](http://api.rubyonrails.org/classes/ActionController/Base.html)
- [Session](http://guides.rubyonrails.org/action_controller_overview.html#session)
- [Bcrypt & has_secure_password](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html)
- [Filters](http://guides.rubyonrails.org/action_controller_overview.html#filters)
