class Checkout

  PRODUCTS = YAML::load(File.open(File.join('config', 'products.yml')))
  VALID_PROMOTIONS = [:CardHolder, :TenPercent]

  attr_reader :basket, :promotions

  def initialize(promotions=[])
    @basket = []
    @promotions = promotions

    validate_promotions!
  end

  def scan(code)
    if PRODUCTS.any? { |h| h["code"] == code }
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
    basket.inject(0) do |sum, code|
      sum + PRODUCTS.detect { |h| h["code"] == code }["price"]
    end.round(2)
  end

  def item_added_success_message(product_name)
    puts "Added #{product_name} to your basket"
  end

  def discount_amount
    current_total = total_before_discount
    discount = 0

    promotions.each do |promotion|
      promo_klass = Module.const_get(promotion)
      discount += promo_klass.new(basket, current_total).calculate
      current_total -= discount
    end
    discount
  end

  def validate_promotions!
    raise InvalidPromotionGiven unless (promotions - VALID_PROMOTIONS).empty?
  end
end