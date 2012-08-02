require 'spec_helper'

describe User do

  before :each do
    @attr = {
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should require an user name" do
    no_user_name = User.new(@attr.merge(:name => ""))
    no_user_name.should_not be_valid
  end

  it "should login with name or email" do
    user_name = User.find_first_by_auth_conditions(
      {
        :name => "Example User",
        :email => "user@example.com",
        :login => "sdfdgf"
      })
    user_name.should be_nil
  end

  it "should test conditions of login" do
    user_name = User.find_first_by_auth_conditions(
      {
        :name => "Example User",
        :email => "user@example.com",
      })
    user_name.should be_nil
  end


end
