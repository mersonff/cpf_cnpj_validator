# CpfCnpjValidator

Same as https://github.com/fnando/cpf_cnpj (all credits to him). Changes only in tests. From Minitest to RSpec.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cpf_cnpj_validator'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cpf_cnpj_validator

## Usage

### Ruby API

This library has the same API for both CNPJ/CPF, so only one of them is
documented below.

```ruby
require "cpf_cnpj"

CPF.valid?(number)    # Check if a CPF is valid
CPF.generate          # Generate a random CPF number
CPF.generate(true)    # Generate a formatted number

cpf = CPF.new(number)
cpf.formatted         # Return formatted CPF (xxx.xxx.xxx-xx)
cpf.stripped          # Return stripped CPF (xxxxxxxxxxx)
cpf.valid?            # Check if CPF is valid
```

#### Strict Validation

By default, validations will strip any characters that aren't numbers. This
means that `532#####820------857\n96` is considered a valid number. To perform a
strict validation use `strict: true`.

```ruby
CPF.valid?(number, strict: true)
```

### Command-line

This library gives you two binaries: `cpf` and `cnpj`.

    $ cpf --check 532.820.857-96
    $ $?
    0

    $ cpf --check 53282085796
    $ $?
    0

    $ cpf --format 53282085796
    532.820.857-96

    $ cpf --strip 532.820.857-96
    53282085796

    $ cpf --generate
    417.524.931-17

    $ cpf --generate --strip
    76001454809

    $ echo 76001454809 | cpf -f
    760.014.548-09
