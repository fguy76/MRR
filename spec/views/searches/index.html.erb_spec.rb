require 'spec_helper'

describe "searches/index" do
  before(:each) do
    assign(:searches, [
      stub_model(Search,
        :keywords => "Keywords",
        :category => "Category"
      ),
      stub_model(Search,
        :keywords => "Keywords",
        :category => "Category"
      )
    ])
  end

  it "renders a list of searches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
