# Helping Hands RESTful API

The Helping Hands API is the back end for the Helping Hands Client. This RESTful API is meant to give routing for the Non-Profit Donation Marketplace. It's complete with the Stripe API, user authorization, creation and non-profit authorization and creation. 

* [Helping Hands Client](https://github.com/VonStein7/helping-hands-client) - The Non-Profit Donation Marketplace Client

## Getting Started

You will need Ruby installed and rails. The current build runs Ruby 2.6.1p33 and Rails 5.2.3. Bundle install or sudo bundle install to load gem file. 

### Installing

```
bundle install
```

or 

```
sudo bundle install
```

### Getting Started

To get started with running the server. This application assumes you have Postgres installed locally on your machine. If you don't you can visit  [Postgres](https://postgresapp.com/downloads.html) for the installation documentation. Then start the server and we can create the database. 

Create the database and Migrate Tables

```
rails db:create && rails db:migrate
```

The seed the database or create your own seeds in the seed file. 

```
rails db:seed
```

Run the server

```
rails s
```

![Rails](https://i.ibb.co/2ybrtLK/Screen-Shot-2019-07-16-at-12-53-09-PM.png "Rails Started")

# RESTful Routes
Here are some routes and example responses for using this api. All test data created using Faker Gem.

### Get All Organizations
```
fetch(http://localhost:3000/api/v1/organizations)
.then(res => res.json())
.then(payload => payload)
```

### Sample Response
```

[
  {
  "id": 3,
  "name": "Abderus's Cb Ga For Anti Septic Problems Organization'",
  "logo_url": "https://robohash.org/ipsamsintat.png?size=300x300&set=set1",
  "mission_statement": "Abderus's mission is to use Tetrahydrocannabinol to help cure anti-septic problems.",
  "bio": "Abderus has had anti-septic problems for centuries. They found relief through CBGa or Tetrahydrocannabinol. This sativa reduces contractions in the small intestines and is being heavily researched by our team. We prefer the capsules method for use.",
  "homepage_url": "https://www.nationalbreastcancer.org",
  "address": "Brooklyn",
  "organization_contacts": [
  {
  "id": 3,
  "organization_id": 3,
  "phone": "1-789-455-6442",
  "email": "test123@gmail.com",
  "created_at": "2019-06-27T21:22:58.553Z",
  "updated_at": "2019-06-27T21:22:58.553Z"
  }
  ],
  "organization_socials": [
  {
  "id": 1,
  "organization_id": 3,
  "social_media_name": "Twitter",
  "url": " https://twitter.com/",
  "created_at": "2019-06-27T21:22:58.565Z",
  "updated_at": "2019-06-27T21:22:58.565Z"
  },
  {
  "id": 2,
  "organization_id": 3,
  "social_media_name": "Instagram",
  "url": "https://www.instagram.com/",
  "created_at": "2019-06-27T21:22:58.571Z",
  "updated_at": "2019-06-27T21:22:58.571Z"
  }
  ],
  "organization_images": [
  {
  "id": 10,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.616Z",
  "updated_at": "2019-06-27T21:22:58.616Z"
  },
  {
  "id": 9,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.612Z",
  "updated_at": "2019-06-27T21:22:58.612Z"
  },
  {
  "id": 8,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.609Z",
  "updated_at": "2019-06-27T21:22:58.609Z"
  },
  {
  "id": 7,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.605Z",
  "updated_at": "2019-06-27T21:22:58.605Z"
  },
  {
  "id": 6,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.602Z",
  "updated_at": "2019-06-27T21:22:58.602Z"
  },
  {
  "id": 5,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.598Z",
  "updated_at": "2019-06-27T21:22:58.598Z"
  },
  {
  "id": 4,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.594Z",
  "updated_at": "2019-06-27T21:22:58.594Z"
  },
  {
  "id": 3,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.591Z",
  "updated_at": "2019-06-27T21:22:58.591Z"
  },
  {
  "id": 2,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.587Z",
  "updated_at": "2019-06-27T21:22:58.587Z"
  },
  {
  "id": 1,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.583Z",
  "updated_at": "2019-06-27T21:22:58.583Z"
  }
  ],
  "organization_members": [
  {
  "id": 1,
  "organization_id": 3,
  "email": "stein@stein.com"
  }
  ],
  "supporters": [
  {
  "id": 1,
  "organization_id": 3,
  "user_id": 1,
  "user": {
  "id": 1,
  "email": "stein@gmail.com"
  }
  },
  {
  "id": 11,
  "organization_id": 3,
  "user_id": 2,
  "user": {
  "id": 2,
  "email": "test1"
  }
  }
  ],
  "events": [
  {
  "id": 1,
  "name": "Abderus's Tetrahydrocannabinol drive.",
  "description": "Abderus is hosting a Tetrahydrocannabinol drive. All donations will go toward research for reduces contractions in the small intestines research.",
  "users": [
  {
  "id": 1,
  "email": "stein@gmail.com"
  }
  ]
  },
  {
  "id": 2,
  "name": "Abderus's Tetrahydrocannabinol drive.",
  "description": "Abderus is hosting a Tetrahydrocannabinol drive. All donations will go toward research for reduces contractions in the small intestines research.",
  "users": []
  }
  ]
  },
]
```

### Organization Show Route
```
fetch(http://localhost:3000/api/v1/organizations/{:id})
.then(res => res.json())
.then(payload => payload)
```

### Sample Response
```
{
  "id": 3,
  "name": "Abderus's Cb Ga For Anti Septic Problems Organization'",
  "logo_url": "https://robohash.org/ipsamsintat.png?size=300x300&set=set1",
  "mission_statement": "Abderus's mission is to use Tetrahydrocannabinol to help cure anti-septic problems.",
  "bio": "Abderus has had anti-septic problems for centuries. They found relief through CBGa or Tetrahydrocannabinol. This sativa reduces contractions in the small intestines and is being heavily researched by our team. We prefer the capsules method for use.",
  "homepage_url": "https://www.nationalbreastcancer.org",
  "address": "Brooklyn",
  "organization_contacts": [
  {
  "id": 3,
  "organization_id": 3,
  "phone": "1-789-455-6442",
  "email": "test123@gmail.com",
  "created_at": "2019-06-27T21:22:58.553Z",
  "updated_at": "2019-06-27T21:22:58.553Z"
  }
  ],
  "organization_socials": [
  {
  "id": 1,
  "organization_id": 3,
  "social_media_name": "Twitter",
  "url": " https://twitter.com/",
  "created_at": "2019-06-27T21:22:58.565Z",
  "updated_at": "2019-06-27T21:22:58.565Z"
  },
  {
  "id": 2,
  "organization_id": 3,
  "social_media_name": "Instagram",
  "url": "https://www.instagram.com/",
  "created_at": "2019-06-27T21:22:58.571Z",
  "updated_at": "2019-06-27T21:22:58.571Z"
  }
  ],
  "organization_images": [
  {
  "id": 10,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.616Z",
  "updated_at": "2019-06-27T21:22:58.616Z"
  },
  {
  "id": 9,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.612Z",
  "updated_at": "2019-06-27T21:22:58.612Z"
  },
  {
  "id": 8,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.609Z",
  "updated_at": "2019-06-27T21:22:58.609Z"
  },
  {
  "id": 7,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.605Z",
  "updated_at": "2019-06-27T21:22:58.605Z"
  },
  {
  "id": 6,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.602Z",
  "updated_at": "2019-06-27T21:22:58.602Z"
  },
  {
  "id": 5,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.598Z",
  "updated_at": "2019-06-27T21:22:58.598Z"
  },
  {
  "id": 4,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.594Z",
  "updated_at": "2019-06-27T21:22:58.594Z"
  },
  {
  "id": 3,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.591Z",
  "updated_at": "2019-06-27T21:22:58.591Z"
  },
  {
  "id": 2,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.587Z",
  "updated_at": "2019-06-27T21:22:58.587Z"
  },
  {
  "id": 1,
  "organization_id": 3,
  "img_url": "http://loremflickr.com/500/500/helping,help",
  "created_at": "2019-06-27T21:22:58.583Z",
  "updated_at": "2019-06-27T21:22:58.583Z"
  }
  ],
  "organization_members": [
  {
  "id": 1,
  "organization_id": 3,
  "email": "stein@stein.com"
  }
  ],
  "supporters": [
  {
  "id": 1,
  "organization_id": 3,
  "user_id": 1,
  "user": {
  "id": 1,
  "email": "stein@gmail.com"
  }
  },
  {
  "id": 11,
  "organization_id": 3,
  "user_id": 2,
  "user": {
  "id": 2,
  "email": "test1"
  }
  }
  ],
  "events": [
  {
  "id": 1,
  "name": "Abderus's Tetrahydrocannabinol drive.",
  "description": "Abderus is hosting a Tetrahydrocannabinol drive. All donations will go toward research for reduces contractions in the small intestines research.",
  "users": [
  {
  "id": 1,
  "email": "stein@gmail.com"
  }
  ]
  },
  {
  "id": 2,
  "name": "Abderus's Tetrahydrocannabinol drive.",
  "description": "Abderus is hosting a Tetrahydrocannabinol drive. All donations will go toward research for reduces contractions in the small intestines research.",
  "users": []
  }
  ]
}
```

### Create an Organization
```
fetch(http://localhost:3000/api/v1/organizations, {
  method:"POST",
  headers:{
  Accept:"application/json",
  Content-Type:"application/json",
  },
  body: JSON.stringify(new_organization)
})
.then(res => res.json())
.then(payload => payload)
```

### Sample Response
```
{
    "id": 54,
    "name": "test",
    "logo_url": "",
    "mission_statement": "",
    "bio": "",
    "homepage_url": "",
    "address": "",
    "organization_contacts": [],
    "organization_socials": [],
    "organization_images": [],
    "organization_members": [],
    "supporters": [],
    "events": []
}
```

### Update an Organization
```
fetch(http://localhost:3000/api/v1/organizations, {
  method:"POST",
  headers:{
  Accept:"application/json",
  Content-Type:"application/json",
  },
  body: JSON.stringify(updated_organization)
})
.then(res => res.json())
.then(payload => payload)
```

### Sample Response
```
{
    "id": 54,
    "name": "updatedtest",
    "logo_url": "",
    "mission_statement": "",
    "bio": "",
    "homepage_url": "",
    "address": "",
    "organization_contacts": [],
    "organization_socials": [],
    "organization_images": [],
    "organization_members": [],
    "supporters": [],
    "events": []
}
```

### Delete an Organizations
```
fetch(http://localhost:3000/api/v1/organizations/{:id}, {
  method:"DELETE",
  headers:{
  Accept:"application/json",
  Content-Type:"application/json",
  },
  body: JSON.stringify(organization.id)
})
.then(res => res.json())
.then(payload => payload)
```

### Sample Response
```
{
    "success": "You successefully removed your organization."
}
```

##User Routes


## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Backend Server
* [Postgres](https://postgresapp.com/) - Database management
* [Stripe](https://stripe.com/) - Payment Gateway

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Author

* **Brenden Williams** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Big Ups to Flatiron School and my Cohort for supporting me through this project.






