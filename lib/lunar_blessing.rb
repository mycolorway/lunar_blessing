require "lunar_blessing/version"
require "lunar_blessing/dates_maping"
require 'date'

module LunarBlessing
  class Date
    include DatesMaping

    MIN_YEAR = 1900
    MAX_YEAR = 2099

    attr_reader :year, :month, :day, :leap

    def initialize(year:, month:, day:, leap: false)
      raise OutOfRange.new(year) if year < MIN_YEAR || year > MAX_YEAR

      @year = year
      @month = month
      @day = day
      @leap = leap
      @leap_month = DATES_MAPPING[offset][0].to_i

      reset_month_by_leap
      init_solar_date

      if @month > 12
        @solar_year += 1
        @solar_month -= 12
      end
    end

    def to_solar
      solar_date.to_s
    end

    private

    def solar_date
      ::Date.new(solar_year, solar_month, solar_day) + (day - 1)
    end

    def offset
      @offset ||= year - MIN_YEAR
    end

    def solar_string
      @solar_string ||= DATES_MAPPING[offset][month]
    end

    def solar_month
      @solar_month ||= solar_string[0..1].to_i
    end

    def solar_day
      @solar_day ||= solar_string[-2..-1].to_i
    end

    def solar_year
      @solar_year ||= year
    end

    def reset_month_by_leap
      if leap || (@leap_month > 0 && month > @leap_month)
        @month += 1
      end
    end

    def init_solar_date
      solar_year
      solar_month
      solar_day
    end


  end

  class OutOfRange < StandardError
    attr_reader :year
    def initialize(year)
      @year = year
    end

    def message
      "The #{year} year you provided is out of range. This gem only support 1900 - 2099."
    end
  end
end
