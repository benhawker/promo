class Checkout

  PRODUCTS = YAML::load(File.open(File.join('config', 'products.yml')))

  attr_reader :basket

  def initialize
    @basket = []
  end

  def scan(code)
    if PRODUCTS.has_key?(code)
      puts "Added product to your basket"
      basket << code
    else
      puts "We don't recognise this product. Type `?` for Help"
      raise InvalidProduct
    end
  end

  def total
    basket.inject(0) { |sum, product_code| sum + PRODUCTS[product_code]["price"]}
  end
end