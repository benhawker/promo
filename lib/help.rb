class Help
  class << self
    def show
      msg = <<-HELPMSG
        #{hl("Checkout Help", :green)}
        ------------------------------
        #{hl("Valid Products are:", :cyan)}
          #{products}
        #{hl("Example session:", :cyan)}
        co = Checkout.new
        co.scan(1)
        co.scan(2)
        co.total
        ...

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

      @products ||= products
    end
  end
end