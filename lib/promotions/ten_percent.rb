class TenPercent < PromotionCalculator

  SPEND_GREATER_THAN  = 60
  PERCENTAGE_DISCOUNT = 10.00

  def calculate
    if total > SPEND_GREATER_THAN
      total / PERCENTAGE_DISCOUNT
    else
      0
    end
  end

end
