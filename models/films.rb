require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(films)
    @id = films['id'].to_i if films['id']
    @title = films['title']
    @price = films['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first()
    @id = film['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map{|film| Film.new(film)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    film = self.new(result.first)
    return film
  end

end
