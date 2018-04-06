# Nmax


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nmax'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nmax

## Usage


```
# гигабайтный файл с рандомными числобуквенными символами, табами и пробелами
< /dev/urandom tr -dc "[:space:][:print:]" | head -c1000000000 > file
# запуск экстрактора
time cat file2 | bundle exec bin/nmax 1000
```