require('pg')

class Shoe

  attr_reader(:first_name, :last_name, :address, :quantity, :size)

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
    @quantity = options['quantity'].to_i
    @size = options['size'].to_i
  end

  def space_between_names
    with_space = "#{first_name} #{last_name}"
    return with_space
  end

  def total
    return @quantity * 45
  end

  def save()
    db = PG.connect({dbname: 'shoe_shop', host: 'localhost'})
    sql = "INSERT INTO shoes (
    first_name,
    last_name,
    address,
    quantity,
    size) VALUES (
    '#{@first_name}',
     '#{@last_name}',
      '#{@address}',
       #{@quantity},
        #{@size})"

    db.exec(sql)
    db.close
  end

  def self.all()
    db = PG.connect({dbname: 'shoe_shop', host: 'localhost'})
    sql = "SELECT * FROM shoes"
    shoes = db.exec(sql)
    result = shoes.map {|shoe| Shoe.new(shoe)}
    db.close
    return result
  end

end