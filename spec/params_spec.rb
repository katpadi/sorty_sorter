require 'spec_helper'
describe SortySorter::Params do

  before(:each) do
    clean_database
    10.times do
      Drone.create!(points: rand(1..100), name: (0...8).map { (65 + rand(26)).chr }.join)
    end
  end

  context "Bang method" do
    it "raises error when exposed attribute is invalid" do 
      expect{Drone.all.sorty_sort!('amfufu', 'asc')}.to raise_error(SortySorter::Errors::InvalidExposedAttribute)
    end

    it "raises error when no such column" do 
      expect{Drone.all.sorty_sort!('no_such_col', 'desc')}.to raise_error(SortySorter::Errors::ColumnDoesNotExist)
    end

    it "raises error when invalid definition" do 
      expect{Drone.all.sorty_sort!('', 'desc')}.to raise_error(SortySorter::Errors::InvalidColumnDefined)
    end
  end
end