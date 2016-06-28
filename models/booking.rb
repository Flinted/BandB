require ('pg')

class Booking

  attr_reader( :id, :first_name, :last_name, :nights, :breakfast, :type, :check_in )

  def initialize( options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @check_in = options['check_in']
    @nights = options['nights'].to_i
    @breakfast = options['breakfast']
    @type = options['type']
  end

  def pretty_name()
    return @first_name.concat(" #{@last_name}")
  end

  def total()
    return @nights * 50
  end

  def save()
    db = PG.connect({dbname: 'BandB', host: 'localhost'})
    sql = "INSERT INTO bookings (
        first_name, 
        last_name, 
        check_in,
        nights, 
        breakfast,
        type) 
      VALUES (
        '#{@first_name}',
        '#{@last_name}',
        '#{@check_in}',
        '#{@nights}',
        '#{@breakfast}',
        #{@type}) 
      RETURNING *"
    booking_data = db.exec(sql)
    db.close()
    @id =booking_data.first['id'].to_i
  end

  def self.all()
    db = PG.connect({dbname: 'BandB', host: 'localhost'})
    sql= "SELECT * FROM bookings"
    bookings = db.exec(sql)
    db.close()
    result = bookings.map {|booking| Booking.new(pizza)}
    return result
  end
end
