Day 33: Wizards, Following, PDF
============

Quiz:
----

Imagine a database table named `products`, with the following columns:

* name : string
* `price_in_cents` : integer
* inventory : integer
* photo : string (using carrierwave)
* `category_id` : integer


Write the class definition for the ActiveRecord::Base object. Include the
follwing:

1. Validation for all fields
1. The carrierwave uploader mounting
1. Relationships (category)

Hard Mode:

1. Include a method `price` that will return the price in dollars
1. Include a method `price=` that will take the price in dollars and store it in
   cents


Today
-----

1. `wicked` - wizards
2. `acts_as_follower`
3. `wicked_pdf` - PDF creation
4. `rails_admin`

Homework
--------

Take day-31 homework and:

1. Add a name for each picture (in the form, and the data)
1. add a "Sign up" wizard and make the user accept the terms after username/password
1. add a search form to search for the photos and display results
