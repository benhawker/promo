![Travis Build](https://travis-ci.org/benhawker/promo.svg?branch=alternative)
[![Coverage Status](https://coveralls.io/repos/benhawker/promo/badge.svg?branch=master&service=github)](https://coveralls.io/github/benhawker/promo?branch=alternative)


# Promo Checkout

A Ruby 2.3 appliction that builds a checkout system with a variety of promotional rules.

===================

### Usage:

Allow executable permissions:

```
chmod +x bin/console
```

To start a session:

```
bin/console
```


Run the specs:
```
rspec
```

===================

Example session:

```
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
```

