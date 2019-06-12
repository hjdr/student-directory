require "directory.rb"

describe Villains do
  describe "#method adds students to an array" do
    it "should return an array" do
      expect(Villains.add_students_to_array({a: "b"})).to be_an_instance_of(Array)
    end
  end
end

describe Villains do
  describe "#method adds students to an array"  do
    it "the returned array should include a hash(s)" do
      expect(Villains.add_students_to_array({a: "b"})).to include(Hash)
    end
  end
end

