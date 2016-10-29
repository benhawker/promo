class PromotionCalculator

  PROMOTIONS = YAML::load(File.open(File.join('config', 'promotions.yml')))

  attr_reader :basket, :total

  def initialize(basket, total)
    @basket = basket
    @total = total
  end

  def calculate
    product_specific_discount + basket_total_specific_discount
  end

  private

  def product_specific_discount
    product_promos = PROMOTIONS["product_multiples_greater_or_equal_to"]
    product_code = product_promos["product_code"]

    if basket_counts[product_code] >= product_promos["condition"]
      product_promos["discount"] * basket_counts[1]
    else
      0
    end
  end

  def basket_total_specific_discount
    total_less_product_discount = total - product_specific_discount
    basket_promos = PROMOTIONS["basket_total_greater_than"]

    if total_less_product_discount > basket_promos["condition"]
      total_less_product_discount / basket_promos["discount"]
    else
      0
    end
  end

  def basket_counts
    counts = basket.group_by{ |item| item }.map{|k,v| [k, v.count] }
    counts = Hash[*counts.flatten]
  end
end