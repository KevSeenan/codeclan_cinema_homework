require('pry-byebug')
require_relative('./models/customers.rb')
# require_relative('./models/films.rb')
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

binding.pry
nil
