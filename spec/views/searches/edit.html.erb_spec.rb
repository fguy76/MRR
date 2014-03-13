require 'spec_helper'

describe "searches/edit" do
  before(:each) do
    @search = assign(:search, stub_model(Search,
      :keywords => "MyString",
      :category => "MyString"
    ))
  end

  it "renders the edit search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", search_path(@search), "post" do
      assert_select "input#search_keywords[name=?]", "search[keywords]"
      assert_select "input#search_category[name=?]", "search[category]"
    end
  end
end
