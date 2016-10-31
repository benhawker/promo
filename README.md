![Travis Build](https://travis-ci.org/benhawker/promo.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/benhawker/promo/badge.svg?branch=master&service=github)](https://coveralls.io/github/benhawker/promo?branch=master)


# Promo Checkout

A Ruby 2.3 appliction that builds a checkout system with a variety of promotional rules.

There are 2 branches with 2 valid approaches:

- `master` makes heavy use of YAML to define the promotions. `Checkout` does not accept any promotional rules as they are pre-defined by `promotions.yml`.

- `alternative` defines the promotions as separate classes that inherit from `PromotionCalculator`. `Checkout` accepts the passing of specific promotions (as long as they are valid) as the sample interface requested.

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

