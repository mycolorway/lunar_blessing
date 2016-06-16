# LunarBlessing

![](https://i.ytimg.com/vi/LRztF05kE4s/hqdefault.jpg)

LunarBlessing is created for converting Chinese Lunar Calendar date to Solar Calendar date.
It supports years from 1900 to 2099.

Now LunarBlessing is not supporting convert Solar date to Lunar date, but it's already in todo list.
We will add this feature when we need it. So if you wanna contribute, that would be awesome.

## Name
This gem name is inspried by a DOTA HERO called Luna, she has a abilitie called Lunar Blessing. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lunar_blessing', github: 'mycolorway/lunar_blessing'
```

And then execute:

    $ bundle

Now this gem is not published to rubygems.org yet, so install with git or local is neccessary.

## Usage

```ruby
lunar_date = LunarBlessing::Date.new(year: 2015, month: 12, day: 28)
lunar_date.to_solar #=> '2016-02-06'
lunar_date.to_s #=> '腊月廿八'
lunar_date.to_s(with_year: true) #=> '二〇一六年腊月廿八'
```

## Requirement
This gem only support Ruby version >= 2.1, because we use 'keyword arguments' feature.
If you want to remove it and support other ruby versions, a PR is welcome.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## TODO

- [x] Add to_s for LunarBlessing:Date
- [ ] Convert solar date to lunar date
- [x] Write document
