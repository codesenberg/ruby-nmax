# NMax
[![Build Status](https://semaphoreci.com/api/v1/codesenberg/ruby-nmax/branches/master/badge.svg)](https://semaphoreci.com/codesenberg/ruby-nmax)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nmax', git: 'git@github.com:codesenberg/ruby-nmax.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ git clone git@github.com:codesenberg/ruby-nmax.git
    $ cd ruby-nmax && gem build nmax
    $ gem install ./nmax-0.2.0.gem

## Usage


```
# гигабайтный файл с рандомными числобуквенными символами, табами и пробелами
< /dev/urandom tr -dc "[:space:][:print:]" | head -c1073741824 > file
# запуск экстрактора
time cat file | nmax 1000
```
