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

> ### Schemas
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
> ### Controllers
>
> Users
>
> - authenticates, logs in & signs up a user
> - auto_login returns a User & its CartItems
>
> ![auto_login](https://i.imgur.com/U32BISf.png)

## Contact

> - [LinkedIn](https://www.linkedin.com/in/benjamin-alt-higginbotham/)
> - [Portfolio](https://higginbotham.fun/)
> - [Tweet @BenMichaelJord1](https://twitter.com/BenMichaelJord1)
