require 'spec_helper'

require 'support/active_record'

describe Sorty::Sort do

  before(:each) do
    clean_database
  end

  context "Sorts integers correctly" do
    it "DESC" do
      pro = Drone.create!(points: 9999)
      noob = Drone.create!(points: 1)
      mediocre = Drone.create!(points: 500)
      results = Drone.all.sorty_sort!('pointz', 'desc')
      expect(results.index(noob)).to be > results.index(mediocre)
      expect(results.index(mediocre)).to be > results.index(pro)
    end

    it "ASC" do
      noob = Drone.create!(points: 1)
      mediocre = Drone.create!(points: 500)
      pro = Drone.create!(points: 9999)
      results = Drone.all.sorty_sort('points', 'asc')
      expect(results.index(noob)).to be < results.index(mediocre)
      expect(results.index(mediocre)).to be < results.index(pro)
    end
  end

  context "Sorts string correctly" do
    it "DESC" do
      kat = Drone.create!(points: 9999, name: 'Kat')
      zayn = Drone.create!(points: 1, name: 'Zayn Malik')
      andi = Drone.create!(points: 500, name: 'Andi')
      results = Drone.all.sorty_sort!('name', 'desc')
      expect(results.index(andi)).to be > results.index(kat)
      expect(results.index(kat)).to be > results.index(zayn)
    end

    it "ASC" do
      kat = Drone.create!(points: 9999, name: 'Kat')
      zayn = Drone.create!(points: 1, name: 'Zayn Malik')
      andi = Drone.create!(points: 500, name: 'Andi')
      results = Drone.all.sorty_sort!('name', 'asc')
      expect(results.index(zayn)).to be > results.index(kat)
      expect(results.index(kat)).to be > results.index(andi)
    end
  end

  context "Sorts dates correctly" do
    it "DESC" do
      kasalukuyan = Drone.create!(points: 1, name: 'Zayn Malik', updated_at: DateTime.now)
      kahapon = Drone.create!(points: 9999, name: 'Kat', updated_at: 1.day.ago)
      last_year = Drone.create!(points: 500, name: 'Andi', updated_at: 1.year.ago)
      results = Drone.all.sorty_sort!('date', 'desc')
      expect(results.index(last_year)).to be > results.index(kahapon)
      expect(results.index(kahapon)).to be > results.index(kasalukuyan)
    end

    it "ASC" do
      kasalukuyan = Drone.create!(points: 1, name: 'Zayn Malik', updated_at: DateTime.now)
      kahapon = Drone.create!(points: 9999, name: 'Kat', updated_at: 1.day.ago)
      last_year = Drone.create!(points: 500, name: 'Andi', updated_at: 1.year.ago)
      results = Drone.all.sorty_sort!('date', 'asc')
      expect(results.index(kasalukuyan)).to be > results.index(kahapon)
      expect(results.index(kahapon)).to be > results.index(last_year)
    end
  end
end