require 'spec_helper'

describe Akagi do

  it "has version" do
    lambda do
      Akagi::VERSION.should_not be_nil
    end.should_not raise_error
  end

end
