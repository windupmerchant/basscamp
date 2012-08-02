require 'spec_helper'

describe "items/show" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :body => "Body",
      :assigned_to => 1,
      :user => nil,
      :list => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
    rendered.should match(/1/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
