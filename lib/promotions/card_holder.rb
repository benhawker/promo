class CardHolder < PromotionCalculator

  PRODUCT_CODE        = 001
  BUY_X_OR_MORE       = 2
  UNIT_PROMO_DISCOUNT = 9.25 - 8.50

  def calculate
    if product_count >= BUY_X_OR_MORE
      UNIT_PROMO_DISCOUNT * product_count
    else
      0
    end
  end

  private

  def product_count
    basket_counts.fetch(PRODUCT_CODE, 0)
  end

end
