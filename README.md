# Ben's Bikes

This is a front end e-commerce web application built with React. Users can create an account, browse thru products, add items to a cart & checkout. It accesses a full CRUD API built with Ruby on Rails that follows RESTful convention.

## [Video Walkthru](https://www.youtube.com/playlist?list=PLjYC3ZkfhqCpDJl-34_mycn5KZcrrsPKR)

> ### Live Earls:
>
> [bens-bikes-frontend.vercel.app](https://bens-bikes-frontend.vercel.app/)
>
> [bens-bikes-backend.herokuapp.com](https://bens-bikes-backend.herokuapp.com/items)

![Landing page to Ben's Bikes](https://i.imgur.com/Kt3juRq.jpg)

## Technologies Used

> ### Front End:
>
> - React.js
> - JavaScript
> - CSS Components
> - JWT
>
> ### Back End:
>
> - Ruby on Rails
> - PostgresQL
> - JWT
> - BCrypt

## Features & Functions

> ## Schemas
>
> rails generate scaffold to create tables, models & controllers for Users, Items, CartItems, OrderItems & Orders
>
> References:
>
> - User has many orders & has many CartItems
> - CartItems references a User & an Item
> - Orders references a User & an OrderItem
> - OrderItem belongs to an Order
> - add foreign keys
>
> ![foreign keys](https://i.imgur.com/fjAxs3z.png)
>
> ## Controllers
>
> Users
>
> - authenticates, logs in & signs up a user
> - auto_login returns a User & its CartItems
>
> ![auto_login](https://i.imgur.com/U32BISf.png)

> ## Add (Multiple) Cart Items
>
> - handle POST request from front end to /cartitems
> - use .find_by to determine if a cart item with an item_id already exists
> - if so, then update the quantity of that item by 1
> - otherwise, create a new cart item with the params outlined in cartitem_params
>   ![create cart  item](https://i.imgur.com/Pn1brh5.png)

> ## Stripe Credit Card Payments
>
> #### Configuring Stripe
>
> - Create Stripe account to get API keys
> - Create file stripe.rb in /config/initializers
>   - Add API keys (stored as environmental variables)
> - ![stripe.rb](https://i.imgur.com/aNp8b1h.png)
> - Add Environmental variables
>   - Create file called local_env.yml & add it to .gitignore
>   - Store key/value pairs e.g. STRIPE_KEY: "api key"
> - In application.rb add the following code before loading default config
> - ![application.rb add env variables](https://i.imgur.com/eQr0fkr.png)
>
> #### Create Stripe Payment
>
> - Use the PaymentIntents module to create a new payment, passing the Stipe token from the request body
> - ![payment intent](https://i.imgur.com/V3smX7b.png)
> - update order to include the charge
> - ![update order with stripe payment](https://i.imgur.com/sGTHfrq.png)

> ## Pagination
>
> Create API endpoint that returns a count of the items in the inventory
>
> - in routes.rb add route that runs the function 'count' when it recieves a get request from ".../items_count"  
>   ![count route](https://i.imgur.com/qBOoMtM.png)
>
> Write count function
>
> - in items_controller.rb use method .count on Item model to return the total number of items in the inventory
>   ![count function](https://i.imgur.com/1mDqfTK.png)
>
> Add 'will_paginate' to Gemfile
>
> - ![paginate gem](https://i.imgur.com/dgdEZIE.png)
>
> Use 'will_paginate' in items index route to render a specific number of items per page
>
> - in items_controller.rb index route use .paginate method, passing it as arguments the page number and the number of items per page to display
> 
>   ![paginate index route](https://i.imgur.com/EfFIhKq.png)

> ## Activate User's Account w/ email
>
> Add email (string) & activated (boolean) to user's model w/ migrations
>
> ![email migration](https://i.imgur.com/Wpr2tPq.png)
>
> Create AccountActivations controller
>
> ![account activations controller](https://i.imgur.com/kNMtFGD.png)
>
> In routes.rb create named route for edit action
>
> ![account activation edit route](https://i.imgur.com/7Nn0sC2.png)
>
> Create & Hash a unique activation token when creating a new user
>
> - Add activation_digest (string) to user's model w/ migrations
>
> ![activation digest migration](https://i.imgur.com/RwvlHOL.png)
>
> - in models/user.rb convert a user's email to lowercase & make a new activation token _before_ creating a new user
>
> ![before actions](https://i.imgur.com/rfQ6m4d.png)
>
> - in same file, under _private_ create the above functions
>
> ![user email and activation token functions](https://i.imgur.com/CpmOGU4.png)
>
> Generate mailer for account_activation & password_reset
>
> ![generate mailer](https://i.imgur.com/IwUGXIV.png)
>
> In application_mailer.rb change default email
>
> In user_mailer.rb lookup user & send to its email address
>
> ![user mailer](https://i.imgur.com/i0C9Elu.png)
>
> In account_activation.html.erb pass as arguments the user's activation token & email to edit_account_activation_url()
>
> ![email template](https://i.imgur.com/rnHuN4J.png)
>
> Send the email w/ link to activate account using SendGrid
>
> - Sign up for account on SendGrid
>
> - In production.rb add the following configuration
>
> ![send grid configurations](https://i.imgur.com/pYhZ7UV.png)
>
> - In users_controller.rb invoke account_activation() function & .deliver_now method
>
> ![deliver now](https://i.imgur.com/zERje2n.png)
>
> Write Edit action in account_activation_controller.rb
>
> - Find user
> - If there's a user, & it's not already activated, & the activation tokens match (see below), then update user.activated to true
>
> ![edit action](https://i.imgur.com/CpK3WOD.png)
>
> - Match activation tokens, in models/users.rb:
>
> ![decode token](https://i.imgur.com/xawOD4B.png)

## Sources

> [Stripe](https://stripe.com/)
>
> [Setting up Stripe on Rails](https://stripe.com/docs/legacy-checkout/rails)
>
> [Adding Email Verification with Rails](https://3rd-edition.railstutorial.org/book/account_activation_password_reset)

## Contact

> - [LinkedIn](https://www.linkedin.com/in/benjamin-alt-higginbotham/)
> - [Portfolio](https://higginbotham.fun/)
> - [Tweet @BenMichaelJord1](https://twitter.com/BenMichaelJord1)
