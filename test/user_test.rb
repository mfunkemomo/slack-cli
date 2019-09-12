require_relative 'test_helper'

describe "user instantiate" do 
  before do 
    @user1 = SlackCli::User.new(name:"Sara", real_name:"Monick", id: "6")
  end 

  it "should instanitate as SlackCli::User" do
    expect(@user1).must_be_kind_of SlackCli::User
  end 
end 

describe "user list method should return correct values" do 
  before do 
    @user1 = SlackCli::User.new(name:"Sara", real_name:"Monick", id: "6")
  end 

  it "all_users returns as an array with correct number of parameters" do 
    VCR.use_cassette("slack_details") do
      expect(@user1.list).must_be_kind_of Array
      expect(@user1.list.length).must_equal 3 
    end 
  end 

  it "user_hash contains name" do 
    VCR.use_cassette("slack_details") do
      expect(@user1.list[1][:user_name]).must_equal "monick.keo"
    end 
  end 

  it "user_hash contains real name" do 
    VCR.use_cassette("slack_details") do
      expect(@user1.list[1][:real_name]).must_equal "monick.keo"
    end 
  end 

  it "user_hash contains id" do 
    VCR.use_cassette("slack_details") do
      expect(@user1.list[1][:id]).must_equal "UN8JZT96J"
    end 
  end 

  # it "should conceal token in public domains" do 
  #   VCR.use_cassette("slack_details") do

  #   end 
  # end 
end 