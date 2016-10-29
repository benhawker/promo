class Checkout

  PRODUCTS = YAML::load(File.open(File.join('config', 'products.yml')))

  attr_reader :basket

  def initialize
    @basket = []
  end

  def scan(code)
    if PRODUCTS.has_key?(code)
      puts "Added #{PRODUCTS[code]["name"]} to your basket"
      basket << code
    else
      raise InvalidProductGiven
    end
  end

  def total
    total = basket.inject(0) { |sum, code| sum + PRODUCTS[code]["price"]}
    "£" + (sprintf "%.2f", total)
  end

  private


end