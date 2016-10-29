class Help
  class << self
    def show
      msg = <<-HELPMSG
        #{hl("Checkout Help", :red)}
        ------------------------------
        #{hl("Valid Products are:", :cyan)}
        - #{Checkout::PRODUCTS}

        #{hl("Example session:", :green)}
        ...
        ...

      HELPMSG

      STDOUT << msg
    end

    private

    def hl(str, color)
      colorc = {
        red: "\e[31m#{str}\e[0m",
        green: "\e[32m#{str}\e[0m",
        cyan: "\e[36m#{str}\e[0m"
      }

      colorc[color]
    end
  end
end