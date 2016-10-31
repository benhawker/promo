class PromotionCalculator
  attr_reader :basket, :total

  def initialize(basket, total)
    @basket = basket
    @total = total
  end

  private

  def basket_counts
    counts = basket.group_by{ |item| item }.map{ |k,v| [k, v.count] }
    counts = Hash[*counts.flatten]
  end
end