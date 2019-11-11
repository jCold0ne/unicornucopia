
#Unicornucopia
---
## A Unicorn Trading Webapp 

https://glacial-taiga-75082.herokuapp.com/

https://github.com/jCold0ne/unicornucopia


###Identification of the problem that needs solving. 

There are no problems in Unicornucopia, it is a place you go to escape from your problems, a place where you can press pause on everyday life. A place where you can simply admire, trade and collect unicorns - its a unicorn game it solves sadness  

At its core, Unicornucopia is inspired by the recent Cryptokitties phenomenom which launched in November 2017. The app enables the the buying and selling of Ethereum in the form of digital cats - each with their own unique features which determine their rarity and price in the Cryptokitty marketplace. There have been over 3.2 million transactions on the Ethereum blockchain, some of which value a single cat over 150k. 

Unicornucopia hopes to replicate the fundamentals of the Cryptokitty app but instead using AUD as the core transactional currency instead of Ethereum. To my knowledge, there are currently no fiat equivalents of cryptokitties just other iterations which use Ethereum or transact using other cryptocurrencies. This suggests a fiat equivalent could be succesful if composed correctly. In time, Unicornucopia could hope to fill that position. 


###Why is it a problem that needs solving? 

Becuase life is better with unicorns. 

If there is a gap in the marketplace for a fiat unicorn trading game then the idea behind Unicornucopia could be profitable. 



### Purpose

In its current version, Unicornucopia's main purpose is to be a fun way to collect, trade and admire digital unicorns. It aims to spread happiness, grant wishes and bedazzle you with its cuteness.  

In a later version, Unicornucopia hopes to become an actual marketplace where a Unicorn will have a rarity and its value determined by its users.  

### Features

There are three main features which underpin Unicornucopia in its current state. 

- The ability to create and be verified through an account 
- The ability to buy and sell digital unicorns through an in-game currency called Unicoins. 
- The ability to purchase more Unicoins through a Stripe payment gateway. 

Once a new user is created they are gifted 100k Unicoins as an incentive to buy unicorns and engage with the marketplace. For a user to make a profit they must list their newly purchased unicorns at a higher but reasonable price. If a user's balance is exhausted they can purchase more Unicoins directly through a Stripe payment gateway.

Future features...

- A unicorn's attributes are divided into rarity catergories each with unique asthetics. Attributes being: Horn, Mane, Body, Tail, Hooves, Wings, Aura and Description. Upon a unicorns creation their attributes are randomised with each attribute having a rarity score between Common (50%), Uncommon (25%), Rare(19%), Epic(5%), Legendary(1%). The rarer the attribute the more aestheitically pleasing which results in a higher approximate value.  
- New unicorns are introduced into the marketplace through the ability to breed new unicorns in the hope for rarer attributes. Two unicorns (from the same or different users) can be matched to create a new unicorn which rolls for new attributes. The new unicorn is listed for purchase with the profits being split between the owners of the parent unicorns. 

### Sitemap

https://github.com/jCold0ne/unicornucopia/blob/master/app/assets/images/assignment/sitemap.png


### Target Audience 

The target audience for this webapp are children and adults looking to collect and trade digital unicorns. 

- Children: Through of the use of colourful imagery and a fantasy creature. 
- Adults: Through the use of colourful imagery and a fantasy creature + The chance to roll a unicorn which generates a profit.  

### Tech Stack 

Framework: Rails 
Languages: Ruby, HTML, CSS, Javascript
Database: Postgresql
Storage: AWS - S3 
Payments: Stripe
Authentication: Devise
Deployment: Heroku
Additional Gems: Paranoia, Faker,    

### User stories

As a user, I can buy unicorns because unicorns are awesome
As a user, I can list unicorns for sale because I can make a profit
As a user, I can look at unicorns because they are aesthitically pleasing 

### Wireframes
https://github.com/jCold0ne/unicornucopia/blob/master/app/assets/images/assignment/unicornucopia-wireframes.pdf

### ERD
https://github.com/jCold0ne/unicornucopia/blob/master/app/assets/images/assignment/ERD.png  


### Explain the different high-level components (abstractions) in your app

Active storage is used to house the unicorn images. This was implemeneted for scalability purposes for when more unicorns are added and the unicorn breeding feature is added.  



### Detail any third party services that your app will use Stripe, AWS

Unicornucopia harnesses the powers of Stripe, Amazon S3 and Devise. 

- Stripe is used to purchase more Unicoins which are then used to purchase more unicorns. Following the stripe docs, a new payments controller was created with a confirm and success method with the appropriate code. Once a user registers their interest to purchase more Unicoins they are directed to Stripe where they complete their payment. If successful the user is redirected back to Unicornucopia with a corresponding balance increase. 

- Amazon S3 active storage technology is utilised to house the unicorn images. S3 was implemented for future scalability so image records can be stored in cloud storage as well as locally.

- The devise gem is used to handle all user authentication and authorisation. Users are prompted to create an account when first visiting Unicornucopia and are also required to login to make a purchase. 

 


### Model relationships
In alphabetical order:

- Balance

A balance record belongs to a user and a user has many balances. I chose a has many association over a has one association so that a user can view their entire transaction history and not just their current balance. It can be summarised like this, A user has many balance records which they can view because a users balance can change overtime. 

- Conversion 

Not used so can be deleted but i dont want to risk it at the moment. 

- Purchase

A purchase belongs to unicorns listing and belongs to buyer & seller balance. See below, 

belongs_to :unicorns_listing
  belongs_to :buyer_balance, class_name: "Balance"
  belongs_to :seller_balance, class_name: "Balance"

A self referencing table has been used so that a single listing can update both the buyers and sellers balance respectively. Two records are created in the balance table - the buyers balance is deducted whereas the sellers balance is plussed.   


- Unicorn

A unicorn has one picture attached and a many-to-one association with the unicorns table through the unicorns users table. This means a unicorn is associated with one user and this association is tracked in the unicorns user table. See below;

has_one_attached :pic
    has_one :unicorns_user
    has_one :user, through: :unicorns_user

- Unicorns Listing

A unicorns listing is associated with a user and unicorn through the unicorns user table. This means a unicorns listing notes which unicorn is being listed and which user they belong to. See below, 

  belongs_to :unicorns_user, -> { with_deleted }
  has_one :unicorn, through: :unicorns_user
  has_one :user, through: :unicorns_user

- Unicorns User

The unicorns user table associates a Unicorn with a user. Both of which belong to the unicorns user table.  


- User  

As mentioned earlier a user has many balances for transaction keeping purposes and has many unicorns which is tracked through the unicorns user table. See below; 

has_many :unicorns_users
  has_many :unicorns, through: :unicorns_users
  has_many :balances

### Database relations
*Discuss the database relations to be implemented in your application*

When a user signs up their email and encrypted password are stored within the database. 

When a user purchases a unicorn from a listing created by a different user; a new record in the db is created linking the user and unicorn ID. A new balance record is also created deducting the given amount from the user and crediting the sellers balance. Finally a new record in the unicorns user table is created which notes the change of unicorn ownership from the seller to the buyer.  



### Database schema design
https://github.com/jCold0ne/unicornucopia/blob/master/app/assets/images/assignment/ERD.png


### Project Management
I used trello in the initial stages of development to list out the mountain of tasks and various features of the application. I found this to aid my understanding of the full project and gain a better picture of what needs to get done. 

https://github.com/jCold0ne/unicornucopia/blob/master/app/assets/images/assignment/trello1.png

However, I did not return to trello until the end of the project I mostly used pen/paper or Notes, the Mac App, to track tasks and things to do. 

https://github.com/jCold0ne/unicornucopia/blob/master/app/assets/images/assignment/trello2.png








