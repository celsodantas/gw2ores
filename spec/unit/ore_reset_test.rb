require 'spec_helper'
require 'ore_reset'

describe OreReset do

  # return example: 23822 642234 23309304 642222 5856

  it "should not reset ores if arenanet response is empty" do
    ore_reset = OreReset.new
    ore_reset.stub(:check_update).and_return("")
    ore_reset.should_not_receive(:new_version?)

    ore_reset.reset
  end

  it "should not reset ores if arenanet response if html" do
    ore_reset = OreReset.new
    ore_reset.stub(:check_update).and_return("<html DOCTYPE></html>")
    ore_reset.should_not_receive(:new_version?)

    ore_reset.reset
  end

  it "should not reset ores if arenanet response is access denied" do
    ore_reset = OreReset.new
    ore_reset.stub(:check_update).and_return("<TITLE>Access Denied</TITLE></HEAD><BODY><H1>Access Denied</H1>")
    ore_reset.should_not_receive(:new_version?)

    ore_reset.reset
  end

  it "should not reset ores if version if same as previous", :focus => true  do
    OreResetHistory.create(full_response: "23822 642234 23309304 642222 5856") 
    ore_reset = OreReset.new
    ore_reset.stub(:check_update).and_return("23822 642234 23309304 642222 5856")

    expect {
      ore_reset.reset  
    }.to change(OreResetHistory, :count).by(1)
    OreResetHistory.last.new_version.should be_nil
  end

  it "should reset ores if version changes" do
    OreResetHistory.create(full_response: "23822 642234 23309304 642222 5856") 
    ore_reset = OreReset.new
    ore_reset.stub(:check_update).and_return("23822 642235 23309304 642222 5856")

    expect {
      ore_reset.reset
    }.to change(OreResetHistory, :count).by(1)
    OreResetHistory.last.new_version.should_not be_nil
  end
end