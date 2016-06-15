require 'spec_helper'

module LunarBlessing
  describe Date do

    describe".initialize" do
      let(:date) { Date.new(year: 2016, month: 1, day: 1)}
      it "should create the instance" do
        expect(date).to be_instance_of(Date)
        expect(date.year).to eq(2016)
        expect(date.month).to eq(1)
        expect(date.day).to eq(1)
      end
    end
  end

  describe "#to_solar" do

    context "2016-01-01" do
      let(:date) { Date.new(year: 2016, month: 1, day: 1)}
      it "should return 2016-02-08" do
        expect(date.to_solar).to eq('2016-02-08')
      end
    end

    context "2017-01-01" do
      let(:date)  { Date.new(year: 2017, month: 1, day: 1) }
      it "should return 2017-01-28" do
        expect(date.to_solar).to eq('2017-01-28')
      end
    end

    context "2017-01-02" do
      let(:date)  { Date.new(year: 2017, month: 1, day: 2) }
      it "should return 2017-1-29" do
        expect(date.to_solar).to eq('2017-01-29')
      end
    end

    context "2017-01-10" do
      let(:date)  { Date.new(year: 2017, month: 1, day: 10) }
      it "should return 2017-02-06" do
        expect(date.to_solar).to eq('2017-02-06')
      end
    end

    context "1985-04-19" do
      let(:date) { Date.new(year: 1985, month: 4, day: 19)}
      it "should return 1985-06-07" do
        expect(date.to_solar).to eq('1985-06-07')
      end
    end

    context "1982-12-16" do
      let(:date) { Date.new(year: 1982, month: 12, day: 16)}
      it "should return 1983-01-29" do
        expect(date.to_solar).to eq('1983-01-29')
      end
    end

    context "2017-06-06" do
      let(:date) { Date.new(year: 2017, month: 06, day: 06)}
      it "should return 2017-06-29" do
        expect(date.to_solar).to eq('2017-06-29')
      end
    end

    context "run 2017-06-06" do
      let(:date) { Date.new(year: 2017, month: 06, day: 06, leap: true)}
      it "should return 2017-07-28" do
        expect(date.to_solar).to eq('2017-07-28')
      end
    end

    describe OutOfRange do
      context "< 1900" do
        let(:date) { Date.new(year: 1800, month: 6, day: 6)}
        it "should raise the error if the year is out of range" do
          expect {date}.to raise_error(OutOfRange)
        end
      end

      context "> 2099" do
        let(:date) { Date.new(year: 2100, month: 6, day: 6)}
        it "should raise the error if the year is out of range" do
          expect {date}.to raise_error(OutOfRange)
        end
      end

      context "message" do
        it "should give the right message" do
          begin
            raise OutOfRange.new(1800)
          rescue OutOfRange => e
            expect(e.message).to eq('The 1800 year you provided is out of range. This gem only support 1900 - 2099.')
            expect(e.year).to eq(1800)
          end
        end

      end

    end

  end
end
