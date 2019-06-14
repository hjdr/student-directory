require "directory.rb"
require 'rspec'

RSpec.describe Students_academy do
  describe "#add_students_to_array" do
    it "should return an array" do
      expect(subject.add_students_to_array({a: "b"})).to be_an_instance_of(Array)
    end
  end

  describe "#add_students_to_array"  do
    it "returns an array which includes a student info hash(s)" do
      expect(subject.add_students_to_array({a: "b"})).to include(Hash)
    end
  end
  
  describe "#filename_user_input" do
    it "gets filename and passed to load_students method" do
    expect(subject.filename_user_input).to eq (subject.load_students("./lib/testfile.csv"))
    end
  end

end