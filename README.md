# Nmax
[![Build Status](https://travis-ci.org/xfynx/ruby-nmax.svg)](https://travis-ci.org/xfynx/ruby-nmax)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nmax', git: 'git@github.com:xfynx/ruby-nmax.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ git clone git@github.com:xfynx/ruby-nmax.git
    $ cd ruby-nmax && gem build nmax
    $ gem install ./nmax-0.1.0.gem

## Usage


```
# гигабайтный файл с рандомными числобуквенными символами, табами и пробелами
< /dev/urandom tr -dc "[:space:][:print:]" | head -c1000000000 > file
# запуск экстрактора
time cat file2 | nmax 1000
```
