require 'spec_helper'

describe 'access root page', :type => :feature do

	it "it should see a list of servers" do
		visit "/"
		page.all(".server").count.should eq(Server.all.count)
	end

	it "it should see the ores count for server" do
		visit "/"
		page.first(".server").find(".ore_count").text.to_i.should eq Server.first.ore_nodes.count
	end

	it "it should see server ore count update if ore count updates" do
		server = Server.first
		server.ore_nodes << OreNode.create
		
		visit "/"

		page.first(".server").find(".ore_count").text.to_i.should eq Server.first.ore_nodes.count
	end

end