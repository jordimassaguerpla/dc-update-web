require 'rails_helper'

RSpec.describe Run, type: :model do
  context "with start, stop and success values" do
    it "expects to be valid" do
      run = Run.new(start: Time.now, stop: Time.now, success: true)
      expect(run).to be_valid
    end
  end
  context "without start" do
    it "expects to be invalid" do
      run = Run.new(stop: Time.now, success: true)
      expect(run).to_not be_valid
    end
   end
   context "without stop" do
     it "expects to be invalid" do
      run = Run.new(start: Time.now, success: true)
      expect(run).to_not be_valid
     end
   end
   context "without success value" do
     it "expects to be invalid" do
      run = Run.new(start: Time.now, stop: Time.now)
      expect(run).to_not be_valid
     end
   end
   context "with start not a time value" do
     it "expects to be invalide" do
       run = Run.new(start: "no time", stop: Time.now, success: true)
       expect(run).to_not be_valid
     end
   end
   context "with stop not a time value" do
     it "expects to be invalid" do
       run = Run.new(start: Time.now, stop: "not a time", success: true)
       expect(run).to_not be_valid
     end
   end
   context "with success not a boolean value" do
     it "expects to be invalid" do
       run = Run.new(start: Time.now, stop: Time.now, success: "not valid")
       expect(run).to_not be_valid
     end
   end
end
