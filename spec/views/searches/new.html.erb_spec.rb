require 'spec_helper'

describe "searches/new" do
  before(:each) do
    assign(:search, stub_model(Search,
      :keywords => "MyString",
      :category => "MyString"
    ).as_new_record)
  end

  it "renders new search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", searches_path, "post" do
      assert_select "input#search_keywords[name=?]", "search[keywords]"
      assert_select "input#search_category[name=?]", "search[category]"
    end
  end
end
