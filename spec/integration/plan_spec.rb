require 'spec_helper'

module Recurly
  describe Plan do

    around(:each) do |example|
      VCR.use_cassette('plan', &example)
    end

    describe "#all" do
      before(:each) do
        @plans = Plan.all
      end

      it "should return a result" do
        @plans.should be_an_instance_of(Array)
      end
    end

    describe "#find" do
      it "should return the plan" do
        plan = Plan.find(Factory.regular_plan.plan_code)
        plan.should_not be_nil
        plan.name.should_not be_nil
      end
    end

  end
end