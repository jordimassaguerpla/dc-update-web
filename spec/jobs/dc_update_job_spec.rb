require 'rails_helper'

RSpec.describe DcUpdateJob, type: :job do
  context "a call to perform" do
    it "expects a call to run_update" do
      image=double("image")
      allow(image).to receive(:full_name).and_return("fullname")
      allow(image).to receive(:user_id).and_return("1")
      allow(image).to receive(:runs).and_return([])
      allow(image).to receive(:run_update)
      DcUpdateJob.new.perform(image)
    end
  end
end
