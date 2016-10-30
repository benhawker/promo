class Checkout

  PRODUCTS = YAML::load(File.open(File.join('config', 'products.yml')))

  attr_reader :basket

  def initialize
    @basket = []
  end

  def scan(code)
    if PRODUCTS.has_key?(code)
      item_added_success_message(PRODUCTS[code]["name"])
      basket << code
    else
      raise InvalidProductGiven
    end
  end

  def total
   raise EmptyBasket if basket.empty?

    print "Total: £" + (sprintf "%.2f", total_before_discount) + "\n"

    if discount_amount > 0
      print "Promotional Discount has been applied \n"
      puts "New Total: £" + (sprintf "%.2f", total_after_discount)
    end
  end

  private

  def total_after_discount
    (total_before_discount - discount_amount).round(2)
  end

  def total_before_discount
    basket.inject(0) { |sum, code| sum + PRODUCTS[code]["price"]}.round(2)
  end

  def item_added_success_message(product_name)
    puts "Added #{product_name} to your basket"
  end

  def discount_amount
    PromotionCalculator.new(basket, total_before_discount).calculate
  end
end