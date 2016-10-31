require 'yaml'

require './lib/checkout'
require './lib/help'
require './lib/promotion_calculator'

require './lib/promotions/card_holder'
require './lib/promotions/ten_percent'

# Provides user guidance in the console.
def show_help
  Help.show
end

class InvalidProductGiven < StandardError
  def initialize
    super("We don't recognise this product. Type `show_help` for Help.")
  end
end

class EmptyBasket < StandardError
  def initialize
    super("Sorry but we can't provide a total as your basket is empty.")
  end
end

class InvalidPromotionGiven < StandardError
  def initialize
    super("Sorry but we don't have any record of this promotion.")
  end
end


