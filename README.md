### Ecommerce Application

Its a Ecommerce application built in Ruby on Rails . 


## Instructions for Local Setup

* Clone the Repository
```
    https://github.com/bodharth1004/Ecommerce-Test.git
    cd ecommerce-test
```

* Install the gems and dependencies.
```
    bundle install.
    Install Postgres.
    Install Sunspot Solr.
```


* Create database and run migrations.
 
```
    bundle exec rake db:setup
    bundle exec rake db:seed

```

* Start the server
```
    rails s
```

* Admin credentials: 
  Email: admin_user@admin.com
  password: admin123

* Customer credentials: 
  Email: bodharthlonkar@gmail.com.com
  password: 123456

### Funtionalities 
* User signup/signin by devise
*  Two Types Of Roles Admin and User roles
  * Admin : 
	  * Admin can manage orders.
	  * Admin can manage categories.
	  * Admin can manage products.

  ## User: 
        Can add Items to cart and can purchase the items after the complition of payment we send OTP to user for Order Confirmation . Which is done by using Twilio gem .
        After the verification of otp mail is sent to user using OrderNotifier . 

        User can Add , update and delete Items from the cart . 


* Image upload functionality is implemented using carrierwave gem.


## Database Architechure
*** Database architecture diagram is present in erd.pdf file . 



