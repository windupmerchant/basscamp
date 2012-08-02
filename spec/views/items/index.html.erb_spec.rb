require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :body => "Body",
        :assigned_to => 1,
        :user => nil,
        :list => nil
      ),
      stub_model(Item,
        :body => "Body",
        :assigned_to => 1,
        :user => nil,
        :list => nil
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 6
    assert_select "tr>td", :text => nil.to_s, :count => 6
    
  end
end
