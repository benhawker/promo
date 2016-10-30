class Help
  class << self
    def show
      msg = <<-HELPMSG
        #{hl("Checkout Help", :green)}
        ------------------------------
        #{hl("Valid Products are:", :cyan)}
          #{products}
        #{hl("Example session:", :cyan)}
        > co = Checkout.new
        => #<Checkout:0x007fa3713eed08 @basket=[]>

        > co.scan 1
        Added Travel Card Holder to your basket
        => [1]

        > co.scan 1
        Added Travel Card Holder to your basket
        => [1, 1]

        > co.scan 2
        Added Personalised Cufflinks to your basket
        => [1, 1, 2]

        > co.total
        Total: £63.50
        Promotional Discount has been applied
        New Total: £55.80
      HELPMSG
      STDOUT << msg
    end

    private

    def hl(str, color)
      colorc = {
        green: "\e[32m#{str}\e[0m",
        cyan: "\e[36m#{str}\e[0m"
      }

      colorc[color]
    end

    def products
      products = ""

      Checkout::PRODUCTS.values.each do |product|
        products << "- " + product.to_s + "\n          "
      end
      products
    end
  end
end