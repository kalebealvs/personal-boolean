require './new_boolean'

describe "Personal if" do
  it "returns true when expression is true" do
    (1 == 1).if_then.should eq(true)
    (20 > 10).if_then.should eq(true)
    (true).if_then.should eq(true)
  end

  it "return false when expression is false" do
    (20 != 20).if_then.should eq(false)
    (200 < 0).if_then.should eq(false)
    (false).if_then.should eq(false)
  end

  it "should return execution of if_then" do
    value  = "foo"
    expect((5 > 4).if_then{value_of_return = "foo"; value_of_return}).to eq(value)
    expect((10 > 0).if_then{4 + 6}).to eq(10)
  end

  it "should return execution of else" do
    expect((10 > 100).if_then{10}.else{20}).to eq(20)
    expect((false).if_then{"Lie"}.else{"Truth"}).to eq("Truth")
    expect((4 * 2  == 10).if_then{klass = Class.new; klass.class}.else{Object.new.class}).to eq(Object)
  end
end
