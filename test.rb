# Create new resto

# just create the instance
new_resto = Restaurant.new
new_resto.name = "??"
new_resto.rating = 0
new_resto.chef_name = "??"

# second way
new_resto = Restaurant.new(
  name: "??",
  rating: 0,
  chef_name: "??"
)

# save it to the DB
new_resto.save


Restaurant.create( #new & save
  name: "??",
  rating: 0,
  chef_name: "??"
)