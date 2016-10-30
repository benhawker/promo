class PromotionCalculator

  PROMOTIONS = YAML::load(File.open(File.join('config', 'promotions.yml')))

  attr_reader :basket, :total

  def initialize(basket, total)
    @basket = basket
    @total = total
  end

  def calculate
    product_specific_discounts + basket_total_specific_discounts
  end

  private

  def product_specific_discounts
    discount = 0

    PROMOTIONS["product_multiples_greater_or_equal_to"].each do |promo|
      product_count = basket_counts.fetch(promo["product_code"], 0)

      if product_count >= promo["condition"]
        discount += promo["discount"] * product_count
      end
    end
    discount
  end

  def basket_total_specific_discounts
    discount = 0
    total_less_product_discount = total - product_specific_discounts

    PROMOTIONS["basket_total_greater_than"].each do |promo|
      if total_less_product_discount > promo["condition"]
        discount += total_less_product_discount / promo["discount"]
      end
    end
    discount
  end

  def basket_counts
    counts = basket.group_by{ |item| item }.map{ |k,v| [k, v.count] }
    counts = Hash[*counts.flatten]
  end
end