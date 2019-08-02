require_relative("../db/sql_runner")
require_relative("./films.rb")
require_relative("./tickets.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(customers)
    @id = customers['id'].to_i if customers['id']
    @name = customers['name']
    @funds = customers['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    customer = self.new(result.first)
    return customer
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets
            ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map{|film_hash| Film.new(film_hash)}
  end

  # def sufficient_funds?(film)
  #   return funds >= film.price()
  # end

  def tickets()
    # Customer buys a ticket, and price of ticket is subtracted from customer funds
    sql = "SELECT SUM(films.price) FROM films INNER JOIN tickets
            ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return @funds - result['sum'].to_i()
  end

end
