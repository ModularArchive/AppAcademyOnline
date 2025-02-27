# # Array Extension
#
# # Topics
#
# * objects, methods, classes
# * reopening classes

require "14_array_extensions" # we don't call it "array.rb" since that would be confusing

describe Array do
  describe "#sum" do
    it "has a #sum method" do
      expect([]).to respond_to(:sum) #Need to define sum
    end

    it "should be 0 for an empty array" do
      expect([].sum).to eq(0)
    end

    it "should add all of the elements" do
      expect([1,2,4].sum).to eq(7)
    end
  end

  describe "#square" do
    it "does nothing to an empty array" do
      expect([].square).to eq([]) #need to define square and give it the ability to square other number (squaring)
    end

    it "returns a new array containing the squares of each element" do
      expect([1,2,3].square).to eq([1,4,9])
    end
  end

  describe "#square!" do
    it "squares each element of the original array" do
      array = [1,2,3]
      array.square! # need to define square! and make it square specifically the elements of the original array
      expect(array).to eq([1,4,9])
    end
  end
end
