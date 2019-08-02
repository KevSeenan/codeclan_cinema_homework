class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(tickets)
      @id = tickets['id'].to_i if tickets['id']
      @customer_id = tickets['customer_id'].to_i()
      @film_id = tickets['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first()
    @id = ticket['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map{|ticket| Ticket.new(ticket)}
    return result
  end

end
