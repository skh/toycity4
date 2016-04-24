require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  10.times do
    # you will write the "create" method as part of your project
    attributes = {brand: Faker::Company.name,
                  name: Faker::Commerce.product_name,
                  price: Faker::Commerce.price
    }
    Product.create(attributes)
  end
end
