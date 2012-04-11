require "spec_helper"

describe Ziptastic do
  describe "#query" do
    context "valid zipcode" do 
      context "w/ results" do      
        it "should return an array of results" do
          Ziptastic.search("16335").count.should eq 3
        end
      
        it "each result should have city, state, and country" do
          meadville = Ziptastic.search("16335")[0]
          
          meadville.city.should eq "MEADVILLE"
          meadville.state.should eq "PA"
          meadville.country.should eq "US"
        end
      end
      
      context "no result" do
        it "should return false" do
          Ziptastic.search("8675309").should eq false
        end
      end
    end
        
    context "invalid zipcode" do
      it "should return an exception" do
        expect { Ziptastic.search("16335a") }.to raise_error(Ziptastic::NotZipCode, "16335a is not a zip code!")
      end
    end
  end
end
