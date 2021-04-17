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
>   ![paginate index route](https://i.imgur.com/EfFIhKq.png)

## Sources

> [Stripe](https://stripe.com/)
>
> [Setting up Stripe on Rails](https://stripe.com/docs/legacy-checkout/rails)

## Contact

> - [LinkedIn](https://www.linkedin.com/in/benjamin-alt-higginbotham/)
> - [Portfolio](https://higginbotham.fun/)
> - [Tweet @BenMichaelJord1](https://twitter.com/BenMichaelJord1)
