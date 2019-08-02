require('pry-byebug')
require_relative('./models/customers.rb')
require_relative('./models/films.rb')
# require_relative('./models/tickets.rb')

# Ticket.delete_all()
# Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Kevin Seenan', 'funds' => 50})
customer1.save()
customer2 = Customer.new({ 'name' => 'Lorraine Hunter', 'funds' => 50})
customer2.save()
customer3 = Customer.new({ 'name' => 'Spicy McHaggis', 'funds' => 100})
customer3.save()

customer3.name = "Nanny Ogg"
customer3.funds = 150
customer3.update()

# customer3.delete()

film1 = Film.new({ 'title' => 'Evil Dead: Army of Darkness', 'price' => 5})
film1.save()
film2 = Film.new({ 'title' => 'Back to the Future', 'price' => 5})
film2.save()
film3 = Film.new({ 'title' => 'Pulp Fiction', 'price' => 5})
film3.save()

binding.pry
nil
