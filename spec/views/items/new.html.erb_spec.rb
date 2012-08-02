require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :body => "MyString",
      :assigned_to => 1,
      :user => nil,
      :list => nil
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path, :method => "post" do
      assert_select "input#item_body", :name => "item[body]"
      assert_select "input#item_assigned_to", :name => "item[assigned_to]"
      assert_select "input#item_user", :name => "item[user]"
      assert_select "input#item_list", :name => "item[list]"
    end
  end
end
